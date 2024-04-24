import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_state/app_state_bloc.dart';
import 'application/application_bloc.dart';
import 'theme/theme_bloc.dart';

class AppBloc {
  static final appStateBloc = AppStateBloc();
  static final themeBloc = ThemeBloc();
  static final applicationBloc = ApplicationBloc();

  static final List<BlocProvider> providers = [
    BlocProvider<AppStateBloc>(
      create: (context) => appStateBloc,
    ),
    BlocProvider<ThemeBloc>(
      create: (context) => themeBloc,
    ),
    BlocProvider<ApplicationBloc>(
      create: (context) => applicationBloc,
    ),
  ];

  static void dispose() {
    appStateBloc.close();
    themeBloc.close();
    applicationBloc.close();
  }

  ///Singleton factory
  static final AppBloc _instance = AppBloc._internal();

  factory AppBloc() {
    return _instance;
  }

  AppBloc._internal();
}