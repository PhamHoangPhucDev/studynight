import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'blocs/app_bloc.dart';
import 'blocs/bloc.dart';
import 'themes/font_family.dart';
import 'themes/theme_service.dart';
import 'themes/themes.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> {

  @override
  void initState() {
    super.initState();
    // AppBloc.applicationBloc.add(OnSetupApplication());
  }

  @override
  void dispose() {
    AppBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return MultiBlocProvider(
    //   providers: AppBloc.providers,
    //   child: BlocBuilder<ThemeBloc, ThemeState>(
    //     builder: (context, theme) {
    //       return BlocBuilder<AuthBloc, AuthState>(
    //         builder: (context, auth) {
    //           return Sizer(
    //             builder: (context, orientation, deviceType) {
    //               return I18n(
    //                 child: GetMaterialApp(
    //                   navigatorKey: AppNavigator.navigatorKey,
    //                   debugShowCheckedModeBanner: false,
    //                   title: 'Cloudmate',
    //                   locale: AppLanguage.defaultLanguage,
    //                   supportedLocales: AppLanguage.supportLanguage,
    //                   localizationsDelegates: [
    //                     GlobalMaterialLocalizations.delegate,
    //                     GlobalWidgetsLocalizations.delegate,
    //                     GlobalCupertinoLocalizations.delegate,
    //                   ],
    //                   theme: AppTheme.light().data,
    //                   darkTheme: AppTheme.dark().data,
    //                   themeMode: ThemeService.currentTheme,
    //                   onGenerateRoute: (settings) {
    //                     return AppNavigator().getRoute(settings);
    //                   },
    //                   home: BlocBuilder<ApplicationBloc, ApplicationState>(
    //                     builder: (context, application) {
    //                       if (application is ApplicationCompleted) {
    //                         if (auth is AuthenticationFail) {
    //                           return AuthenticateScreen();
    //                         }
    //                         if (auth is AuthenticationSuccess) {
    //                           return Navigation();
    //                         }
    //                       }
    //                       return SplashScreen();
    //                     },
    //                   ),
    //                 ),
    //               );
    //             },
    //           );
    //         },
    //       );
    //     },
    //   ),
    // );
  
    return GetMaterialApp(
      builder: EasyLoading.init(builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child??SizedBox(),
        );
      },),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeService.currentTheme,
      darkTheme:  AppTheme.dark().data,
      theme: AppTheme.light().data,
      locale: Locale('vi', 'VN'),
      home: BlocBuilder<ApplicationBloc, ApplicationState>(
        builder: (context, application) {
          // if (application is ApplicationCompleted) {
          //   if (auth is AuthenticationFail) {
          //     return AuthenticateScreen();
          //   }
          //   if (auth is AuthenticationSuccess) {
          //     return Navigation();
          //   }
          // }
          // return SplashScreen();
        },
      ),
    );
  }
}