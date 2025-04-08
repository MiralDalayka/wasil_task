import 'package:flutter/material.dart';

import '../colors.dart';

class TButtonsTheme {
  TButtonsTheme._();

  //? Filled Button
  static FilledButtonThemeData lightFilledButtonStyle = FilledButtonThemeData(
    style: ButtonStyle(
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
    ),
  );
  static FilledButtonThemeData darkFilledButtonStyle = FilledButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStatePropertyAll(Colors.white),
      iconColor: WidgetStatePropertyAll(Colors.white),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
    ),
  );

  //? Outlined Button
  static OutlinedButtonThemeData lightOutlinedButtonStyle =
      OutlinedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(TDarkModeColors.primaryColor),
          iconColor: WidgetStatePropertyAll(Colors.white),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          ),
          side: WidgetStatePropertyAll(
            BorderSide(color: TDarkModeColors.primaryColor),
          ),
        ),
      );
  static OutlinedButtonThemeData darkOutlinedButtonStyle =
      OutlinedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(TDarkModeColors.primaryColor),
          iconColor: WidgetStatePropertyAll(Colors.white),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          ),
          side: WidgetStatePropertyAll(
            BorderSide(color: TDarkModeColors.primaryColor),
          ),
        ),
      );
}
