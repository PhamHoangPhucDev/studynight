import 'package:flutter/material.dart';

import '../app.dart';
import '../models/slide_mode.dart';
import 'app_routes.dart';
import 'scaffold_wrapper.dart';
import 'slides/slide_from_bottom_route.dart';
import 'slides/slide_from_left_route.dart';
import 'slides/slide_from_right_route.dart';
import 'slides/slide_from_top_route.dart';

class AppNavigator {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  SlideMode defautlSlide = SlideMode.right;
  Route<dynamic> getRoute(RouteSettings settings) {
    Map<String, dynamic>? arguments = _getArguments(settings);
    switch (settings.name) {
      case AppRoutes.ROOT:
        return _buildRoute(
          settings,
          App(),
          _getSlideMode(arguments),
        );
      default:
        return _buildRoute(settings, App(), SlideMode.right);
    }
  }

  _buildRoute(
    RouteSettings routeSettings,
    Widget builder,
    SlideMode slideMode,
  ) {
    switch (slideMode) {
      case SlideMode.bot:
        return SlideFromBottomRoute(page: ScaffoldWrapper(child: builder), settings: routeSettings);
      case SlideMode.top:
        return SlideFromTopRoute(page: ScaffoldWrapper(child: builder), settings: routeSettings);
      case SlideMode.left:
        return SlideFromLeftRoute(page: ScaffoldWrapper(child: builder), settings: routeSettings);
      case SlideMode.right:
        return SlideFromRightRoute(page: ScaffoldWrapper(child: builder), settings: routeSettings);
    }
  }

  _getArguments(RouteSettings settings) {
    return settings.arguments;
  }

  _getSlideMode(Map<String, dynamic>? arguments) {
    if (arguments == null) {
      return SlideMode.right;
    } else {
      return arguments['slide'] ?? SlideMode.right;
    }
  }

  static Future push<T>(
    String route, {
    Object? arguments,
  }) {
    return state.pushNamed(route, arguments: arguments);
  }

  static Future replaceWith<T>(
    String route, {
    Map<String, dynamic>? arguments,
  }) {
    return state.pushReplacementNamed(route, arguments: arguments);
  }

  static void popUntil<T>(String route) => state.popUntil(ModalRoute.withName(route));

  static void pop() {
    if (state.canPop()) {
      state.pop();
    }
  }

  static String currentRoute(context) => ModalRoute.of(context)!.settings.name!;

  static NavigatorState get state => navigatorKey.currentState!;
}