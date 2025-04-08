import 'package:flutter/material.dart';

class TIconTheme {
  TIconTheme._();

  static IconThemeData lightIconTheme = IconThemeData().copyWith(
    color: Colors.black,
    size: 24,
  );

  static IconThemeData darkIconTheme = IconThemeData().copyWith(
    color: Colors.white,
    size: 24,
  );
}
