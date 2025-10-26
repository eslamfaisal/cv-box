import 'package:cv_box/presentation/constants/color.dart';
import 'package:flutter/material.dart';

class CTextTheme {
  CTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    headlineMedium: const TextStyle().copyWith(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: CColor.primaryColor,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: CColor.light_secondaryColor,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    headlineMedium: const TextStyle().copyWith(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: CColor.primaryColor,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: CColor.dark_secondaryColor,
    ),
  );
}
