import 'package:cv_box/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CTextTheme {
  CTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    headlineMedium: const TextStyle().copyWith(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: AppColors.primary,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: AppColors.lightSecondaryColor,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    headlineMedium: const TextStyle().copyWith(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: AppColors.primary,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: AppColors.darkSecondaryColor,
    ),
  );
}
