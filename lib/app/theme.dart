import 'package:flutter/material.dart';

/// Application theme configuration.
class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: const Color(0xFF6750A4),
      brightness: Brightness.light,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: const Color(0xFF6750A4),
      brightness: Brightness.dark,
    );
  }
}
