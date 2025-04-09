import 'package:flutter/material.dart';

class TTextTheme {
  TTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    // BIG TITLES
    headlineSmall: TextStyle().copyWith(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.grey,
    ),
    headlineMedium: TextStyle().copyWith(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: Colors.grey,
    ),
    headlineLarge: TextStyle().copyWith(
      fontSize: 40,
      fontWeight: FontWeight.bold,
      color: Colors.grey,
    ),

    // NORMAL TITLES
    titleSmall: TextStyle().copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.grey,
    ),
    titleMedium: TextStyle().copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.grey,
    ),
    titleLarge: TextStyle().copyWith(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: Colors.grey,
    ),

    // BODY TEXTS
    bodySmall: TextStyle().copyWith(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Colors.grey,
    ),
    bodyMedium: TextStyle().copyWith(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: Colors.grey,
    ),
    bodyLarge: TextStyle().copyWith(
      fontSize: 18,
      fontWeight: FontWeight.normal,
      color: Colors.grey,
    ),

    // LABELS AND SMALL TEXT
    labelSmall: TextStyle().copyWith(
      fontSize: 10,
      fontWeight: FontWeight.normal,
      color: Colors.grey,
    ),
    labelMedium: TextStyle().copyWith(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Colors.grey,
    ),
    labelLarge: TextStyle().copyWith(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Colors.grey,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    headlineSmall: TextStyle().copyWith(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headlineMedium: TextStyle().copyWith(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headlineLarge: TextStyle().copyWith(
      fontSize: 40,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),

    // NORMAL TITLES
    titleSmall: TextStyle().copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    titleMedium: TextStyle().copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    titleLarge: TextStyle().copyWith(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),

    // BODY TEXTS
    bodySmall: TextStyle().copyWith(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Colors.white,
    ),
    bodyMedium: TextStyle().copyWith(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: Colors.white,
    ),
    bodyLarge: TextStyle().copyWith(
      fontSize: 18,
      fontWeight: FontWeight.normal,
      color: Colors.white,
    ),

    // LABELS AND SMALL TEXT
    labelSmall: TextStyle().copyWith(
      fontSize: 10,
      fontWeight: FontWeight.normal,
      color: Colors.white,
    ),
    labelMedium: TextStyle().copyWith(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Colors.white,
    ),
    labelLarge: TextStyle().copyWith(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Colors.white,
    ),
  );
}
