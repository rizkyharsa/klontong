import 'package:flutter/material.dart';
import 'package:klontong/theme/custom_theme/appbar_theme.dart';
import 'package:klontong/theme/custom_theme/elevated_button_theme.dart';
import 'package:klontong/theme/custom_theme/text_field_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData klontongTheme = ThemeData(
    useMaterial3: true,
    appBarTheme: KAppbarTheme.klontongAppbarTheme,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    inputDecorationTheme: KTextFieldTheme.klontongInputDecorationTheme,
    elevatedButtonTheme: KElevatedButtonTheme.klontongElevatedButtonTheme,
  );
}
