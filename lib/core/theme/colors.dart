import 'package:flutter/material.dart';

class TLightModeColors {
  TLightModeColors._();

  static Color primaryColor = Color(0xFF60A898);
  static Color secondaryColor = const Color(0xCDFEB5B8);
  static Color thirdColor = const Color(0xCDe0c3f6);
  static Color scaffoldBgColor = Colors.white;
  static Color appBarBgColor = Colors.white;
  static Color appBarFgColor = Colors.black;
  static Color secondaryContainer = Colors.grey.shade100;
  static Color onSecondaryContainer = Colors.grey.shade600;
  static Color outline = Colors.grey.shade400;
  static Color error = Colors.red;
}

class TDarkModeColors {
  TDarkModeColors._();
  static Color primaryColor = Color(0xFF60A898);
  static Color secondaryColor = const Color(0xCDFEB5B8);
  static Color thirdColor = const Color(0xCDe0c3f6);
  static Color scaffoldBgColor = Color(0XFF121212);
  static Color appBarBgColor = Colors.grey.shade700;
  static Color appBarFgColor = Colors.white;
  static Color secondaryContainer = const Color.fromARGB(255, 29, 33, 39);
  static Color onSecondaryContainer = const Color.fromARGB(255, 147, 156, 169);
  static Color outline = Color.fromARGB(255, 147, 156, 169);
  static Color error = Colors.red;
}
