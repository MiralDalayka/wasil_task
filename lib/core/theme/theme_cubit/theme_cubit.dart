import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/get_it/get_it.dart';
import '../../common/services/shared_prefs/shared_prefs.dart';
import '../../constants/constants.dart';
import 'theme_states.dart';

class ThemeCubit extends Cubit<ThemeStates> {
  ThemeCubit() : super(ThemeInitState());
  static ThemeCubit get(context) => BlocProvider.of(context);

  ThemeMode? themeMode;
  void setThemeMode() {
    if (SharedPrefs.getString(Constants.themeModeKey) == ThemeEnums.dark.name) {
      themeMode = ThemeMode.dark;
    } else if (SharedPrefs.getString(Constants.themeModeKey) ==
        ThemeEnums.light.name) {
      themeMode = ThemeMode.light;
    } else {
      themeMode = ThemeMode.system;
    }
  }

  void setDarkMode() {
    themeMode = ThemeMode.dark;
    SharedPrefs.setString(Constants.themeModeKey, ThemeEnums.dark.name);
    reRender();
    emit(ThemeChangeToDarkState());
  }

  void reRender() {
    emit(ReRenderState());
  }

  void setLightMode() {
    themeMode = ThemeMode.light;
    SharedPrefs.setString(Constants.themeModeKey, ThemeEnums.light.name);
    reRender();
    emit(ThemeChangeToLightState());
  }

  void setFollowSystemMode() {
    themeMode = ThemeMode.system;
    SharedPrefs.setString(Constants.themeModeKey, ThemeEnums.system.name);
    reRender();
    emit(ThemeChangeToSystemState());
  }

  bool get isDarkMode =>
      Theme.of(navKey.currentState!.context).brightness == Brightness.dark;

  bool get isTablet {
    final firstView = WidgetsBinding.instance.platformDispatcher.views.first;
    final logicalShortestSide =
        firstView.physicalSize.shortestSide / firstView.devicePixelRatio;
    return logicalShortestSide > 580;
  }

  bool get isPortrait {
    return MediaQuery.of(navKey.currentState!.context).orientation ==
        Orientation.portrait;
  }
}
