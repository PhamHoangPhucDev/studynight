import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../configs/application.dart';
import '../../themes/theme_service.dart';
import '../app_bloc.dart';
import '../bloc.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  ApplicationBloc() : super(InitialApplicationState());

  @override
  Stream<ApplicationState> mapEventToState(event) async* {
    if (event is OnSetupApplication) {
      // Get themeMode
      await Application().initialAppLication();
      AppBloc.themeBloc.add(
        InitialTheme(
          themeMode: ThemeService().isSavedDarkMode() ? ThemeMode.dark : ThemeMode.light,
        ),
      );

      // AppBloc.authBloc.add(OnAuthCheck());

      yield ApplicationCompleted();
    }
  }
}