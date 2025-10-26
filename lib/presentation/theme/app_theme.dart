
import 'package:cv_box/presentation/theme/text_form_field_theme.dart';
import 'package:cv_box/presentation/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'appbar_theme.dart';
import 'elevatedButtonTheme.dart';

class CAppTheme {
 CAppTheme._();

  static  ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'poppins',
    textTheme: CTextTheme.lightTextTheme,
    useMaterial3: true,
    elevatedButtonTheme: CElevatedButtonTheme.lightelevatedButtonThemeData,
    inputDecorationTheme: CTextFormFieldTheme.lightInputDecorationTheme,
    appBarTheme:CAppBarTheme.lightAppBarTheme,
  );
  static  ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    fontFamily: 'poppins',
    textTheme: CTextTheme.darkTextTheme,
    useMaterial3: true,
    elevatedButtonTheme: CElevatedButtonTheme.darkElevatedButtonThemeData,
    inputDecorationTheme: CTextFormFieldTheme.darkInputDecorationTheme,
    appBarTheme:CAppBarTheme.darkAppBarTheme,
  );
}