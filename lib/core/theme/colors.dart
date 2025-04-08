import 'package:flutter/material.dart';

class TLightModeColors {
  TLightModeColors._();

  static Color primaryColor = const Color.fromARGB(255, 14, 95, 245);
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
  static Color primaryColor = const Color.fromARGB(255, 14, 95, 245);
  static Color scaffoldBgColor = Color(0XFF121212);
  static Color appBarBgColor = Colors.grey.shade700;
  static Color appBarFgColor = Colors.white;
  static Color secondaryContainer = const Color.fromARGB(255, 29, 33, 39);
  static Color onSecondaryContainer = const Color.fromARGB(255, 147, 156, 169);
  static Color outline = Color.fromARGB(255, 147, 156, 169);
  static Color error = Colors.red;
}
