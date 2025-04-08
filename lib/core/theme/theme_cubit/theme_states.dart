import 'package:flutter/material.dart';

@immutable
sealed class ThemeStates {}

class ThemeInitState extends ThemeStates {}

class ThemeChangeToDarkState extends ThemeStates {}

class ThemeChangeToLightState extends ThemeStates {}

class ThemeChangeToSystemState extends ThemeStates {}

class ReRenderState extends ThemeStates {}
