import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Color Palette
const Color kBackground    = Color(0xFFFFF0F3); // warm blush — page bg
const Color kSurface       = Color(0xFFFFFFFF); // card surface
const Color kPurpleCard    = Color(0xFFD6D0FF); // "Log today" card
const Color kYellowCard    = Color(0xFFFFF4B0); // "Doctor report" card
const Color kGreenCard     = Color(0xFFD4F0DC); // action card accent
const Color kAlertCard     = Color(0xFFFFF0F0); // elevated risk banner
const Color kAccent        = Color(0xFF6B4EFF); // primary purple CTA
const Color kAccentDeep    = Color(0xFF3D1F8F); // deep purple text
const Color kTextPrimary   = Color(0xFF1A1A2E);
const Color kTextSecondary = Color(0xFF6B6B80);
const Color kSyncGreen     = Color(0xFFB8F5D0); // synced badge bg
const Color kHighRisk      = Color(0xFFFF4D4D); // HIGH RISK headline

/// Application theme configuration.
class AppTheme {
  AppTheme._();

  static ThemeData lightTheme(Locale locale) {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: kBackground,
      colorSchemeSeed: kAccent,
      brightness: Brightness.light,
      textTheme: buildTextTheme(locale),
      appBarTheme: const AppBarTheme(
        backgroundColor: kBackground,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: kTextPrimary),
        titleTextStyle: TextStyle(
          color: kTextPrimary,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  static TextTheme buildTextTheme(Locale locale) {
    final family = switch (locale.languageCode) {
      'kn' => 'NotoSansKannada',
      'te' => 'NotoSansTelugu',
      'hi' || 'mr' => 'NotoSansDevanagari',
      _    => 'NotoSans',
    };
    
    return TextTheme(
      displayLarge : TextStyle(fontFamily: family, fontSize: 34, fontWeight: FontWeight.w700, color: kTextPrimary),
      titleLarge   : TextStyle(fontFamily: family, fontSize: 22, fontWeight: FontWeight.w700, color: kTextPrimary),
      titleMedium  : TextStyle(fontFamily: family, fontSize: 17, fontWeight: FontWeight.w600, color: kTextPrimary),
      bodyLarge    : TextStyle(fontFamily: family, fontSize: 15, fontWeight: FontWeight.w400, color: kTextPrimary),
      bodyMedium   : TextStyle(fontFamily: family, fontSize: 13, fontWeight: FontWeight.w400, color: kTextPrimary),
      labelSmall   : TextStyle(fontFamily: family, fontSize: 11, fontWeight: FontWeight.w500, color: kTextSecondary),
    );
  }
}
