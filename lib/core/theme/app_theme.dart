import 'package:cv_box/core/constants/app_colors.dart';
import 'package:cv_box/core/theme/text_form_field_theme.dart';
import 'package:cv_box/core/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'elevatedButtonTheme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'poppins',
    textTheme: CTextTheme.lightTextTheme,
    useMaterial3: true,
    elevatedButtonTheme: CElevatedButtonTheme.lightelevatedButtonThemeData,
    inputDecorationTheme: CTextFormFieldTheme.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: Colors.black,
    fontFamily: 'poppins',
    textTheme: CTextTheme.darkTextTheme,
    useMaterial3: true,
    elevatedButtonTheme: CElevatedButtonTheme.darkElevatedButtonThemeData,
    inputDecorationTheme: CTextFormFieldTheme.darkInputDecorationTheme,
  );
}
