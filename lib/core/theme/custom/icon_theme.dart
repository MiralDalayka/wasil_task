import 'package:flutter/material.dart';
import 'package:wasil_flutter_task/core/theme/colors.dart';

class TIconTheme {
  TIconTheme._();

  static IconThemeData lightIconTheme = IconThemeData().copyWith(
    color: TLightModeColors.secondaryColor,
    size: 24,
  );

  static IconThemeData darkIconTheme = IconThemeData().copyWith(
    color: Colors.white,
    size: 24,
  );
}
