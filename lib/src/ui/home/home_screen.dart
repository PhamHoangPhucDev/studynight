import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:studynight/src/utils/sizer_custom/sizer.dart';

import '../../blocs/app_bloc.dart';
import '../../blocs/theme/theme_event.dart';
import '../../themes/app_colors.dart';
import '../../themes/font_family.dart';
import '../../themes/theme_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (FocusScope.of(context).hasFocus) {
          FocusScope.of(context).unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
           systemOverlayStyle: ThemeService.systemBrightness,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              // AppBloc.themeBloc.add(
              //   OnChangeTheme(
              //     themeMode: ThemeService.currentTheme == ThemeMode.dark
              //         ? ThemeMode.light
              //         : ThemeMode.dark,
              //   ),
              // );
            },
            icon: Icon(
              ThemeService.currentTheme == ThemeMode.dark
                  ? Icons.wb_sunny_outlined
                  : Icons.subject_outlined,
              size: 22.sp,
              color: Colors.blue,
            ),
          ),
          title: RichText(
              text: TextSpan(
            children: [
              TextSpan(
                text: 'Study',
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: FontFamily.dancing,
                  color: colorPrimary,
                ),
              ),
              TextSpan(
                text: 'night',
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: FontFamily.dancing,
                  color: Theme.of(context).textTheme.bodyLarge!.color,
                ),
              ),
            ],
          )),
          actions: [
            CircleAvatar(),
            SizedBox(width: 5.w,)
          ],
        ),
        body: Container(
          height: 100.h,
          width: 100.w,
          color: Theme.of(context).scaffoldBackgroundColor,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 2.5.sp),
                Divider(
                  height: .25,
                  thickness: .25,
                ),
                Text(
                  'Hey Join'
                ),
                Text(
                  'subtitle Join'
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}