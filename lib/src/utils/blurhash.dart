import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';

import '../resources/base_repository.dart';

const _DEFAULT_SIZE = 2;

/// Display a Hash then fade to Image
class BlurHash extends StatefulWidget {
  const BlurHash({
    required this.hash,
    this.color = Colors.blueGrey,
    this.imageFit = BoxFit.fill,
    this.decodingWidth = _DEFAULT_SIZE,
    this.decodingHeight = _DEFAULT_SIZE,
    this.image,
    this.onDecoded,
    this.onReady,
    this.onStarted,
    this.needStream = false,
    this.duration = const Duration(milliseconds: 0),
    this.curve = Curves.easeOut,
  })  : assert(decodingWidth > 0),
        assert(decodingHeight != 0);

  /// Callback when hash is decoded
  final VoidCallback? onDecoded;

  /// Callback when image is downloaded
  final VoidCallback? onReady;

  /// Callback when image is downloaded
  final VoidCallback? onStarted;

  /// Hash to decode
  final String hash;

  /// Displayed background color before decoding
  final Color color;

  /// How to fit decoded & downloaded image
  final BoxFit imageFit;

  /// Decoding definition
  final int decodingWidth;

  /// Decoding definition
  final int decodingHeight;

  /// Remote resource to download
  final String? image;

  final Duration duration;

  final Curve curve;

  final bool needStream;

  @override
  BlurHashState createState() => BlurHashState();
}

class BlurHashState extends State<BlurHash> {
  StreamController<String> readyController =
      StreamController<String>.broadcast();
  Future<ui.Image>? _image;
  bool? loaded;
  bool? loading;

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() {
    _decodeImage();
    loaded = false;
    loading = false;
  }

  @override
  void didUpdateWidget(BlurHash oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.hash != oldWidget.hash ||
        widget.image != oldWidget.image ||
        widget.decodingWidth != oldWidget.decodingWidth ||
        widget.decodingHeight != oldWidget.decodingHeight) {
      _init();
    }
  }

  void _decodeImage() {
    _image = blurHashDecodeImage(
      blurHash: widget.hash,
      width: widget.decodingWidth,
      height: widget.decodingHeight,
    );
  }

  @override
  Widget build(BuildContext context) => Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          widget.needStream
              ? StreamBuilder(
                  stream: readyController.stream,
                  builder: (context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return buildBlurHashBackground();
                    }

                    return snapshot.data == "false"
                        ? buildBlurHashBackground()
                        : Container();
                  },
                )
              : buildBlurHashBackground(),
          if (widget.image != null) prepareDisplayedImage(),
        ],
      );

  Widget prepareDisplayedImage() => Image.network(widget.image!,
          headers: BaseRepository().getHeaders(),
          fit: widget.imageFit, loadingBuilder: (BuildContext? context,
              Widget? img, ImageChunkEvent? loadingProgress) {
        // Download started
        if (loading == false) {
          loading = true;
          widget.onStarted?.call();
        }

        if (loadingProgress == null) {
          // Image is now loaded, trigger the event
          loaded = true;
          widget.onReady?.call();
          readyController.add("true");
          return _DisplayImage(
            child: img!,
            duration: widget.duration,
            curve: widget.curve,
          );
        } else {
          return SizedBox();
        }
      });

  /// Decode the blurhash then display the resulting Image
  Widget buildBlurHashBackground() => FutureBuilder<ui.Image>(
        future: _image,
        builder: (ctx, snap) => snap.hasData
            ? Image(image: UiImage(snap.data!), fit: widget.imageFit)
            : Container(color: widget.color),
      );
}

// Inner display details & controls
class _DisplayImage extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Curve? curve;

  const _DisplayImage({
    required this.child,
    this.duration = const Duration(milliseconds: 800),
    this.curve,
  });

  @override
  _DisplayImageState createState() => _DisplayImageState();
}

class _DisplayImageState extends State<_DisplayImage>
    with SingleTickerProviderStateMixin {
  Animation<double>? opacity;
  AnimationController? controller;

  @override
  Widget build(BuildContext context) => FadeTransition(
        opacity: opacity!,
        child: widget.child,
      );

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: widget.duration, vsync: this);
    final curved = CurvedAnimation(parent: controller!, curve: widget.curve!);
    opacity = Tween<double>(begin: .0, end: 1.0).animate(curved);
    controller!.forward();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }
}

class UiImage extends ImageProvider<UiImage> {
  final ui.Image image;
  final double scale;

  const UiImage(this.image, {this.scale = 1.0});

  @override
  Future<UiImage> obtainKey(ImageConfiguration configuration) =>
      SynchronousFuture<UiImage>(this);

  @override
  // ignore: deprecated_member_use
  ImageStreamCompleter load(UiImage key, decode) =>
      OneFrameImageStreamCompleter(_loadAsync(key));

  Future<ImageInfo> _loadAsync(UiImage key) async {
    assert(key == this);
    return ImageInfo(image: image, scale: key.scale);
  }

  @override
  bool operator ==(dynamic other) {
    if (other.runtimeType != runtimeType) return false;
    final UiImage typedOther = other;
    return image == typedOther.image && scale == typedOther.scale;
  }

  @override
  // ignore: deprecated_member_use
  int get hashCode => hashValues(image.hashCode, scale);

  @override
  String toString() =>
      '$runtimeType(${describeIdentity(image)}, scale: $scale)';
}