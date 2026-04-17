import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

// ──────────────────────────────────────────────────────────────
//  Language service
// ──────────────────────────────────────────────────────────────

/// Manages app language selection with local persistence.
///
/// The selected language is stored via [SharedPreferences] so
/// it survives app restarts and works fully offline.
class LanguageService extends ChangeNotifier {
  static const String _prefKey = 'selected_language';

  /// Supported language codes.
  static const List<String> supportedCodes = ['en', 'hi', 'kn', 'mr', 'te'];

  /// Maps language codes to their full names (used in Gemini prompts).
  static const Map<String, String> languageNames = {
    'en': 'English',
    'hi': 'Hindi',
    'kn': 'Kannada',
    'mr': 'Marathi',
    'te': 'Telugu',
  };

  Locale _locale = const Locale('en');

  /// The currently active locale.
  Locale get locale => _locale;

  /// The current language code (e.g. 'en', 'hi').
  String get currentLanguageCode => _locale.languageCode;

  /// The full name of the current language (e.g. 'English', 'Hindi').
  String get currentLanguageName =>
      languageNames[currentLanguageCode] ?? 'English';

  /// Loads the persisted language preference from disk.
  ///
  /// Call this once during app startup (before `runApp`).
  Future<void> load() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedCode = prefs.getString(_prefKey);

      if (savedCode != null && supportedCodes.contains(savedCode)) {
        _locale = Locale(savedCode);
        debugPrint('[Language] Loaded persisted language: $savedCode');
      } else {
        debugPrint('[Language] No saved preference — defaulting to en.');
      }
    } catch (e) {
      debugPrint('[Language] Failed to load preference: $e');
      // Graceful fallback to English — no crash.
    }
  }

  /// Returns the current language code.
  String getCurrentLanguage() => currentLanguageCode;

  /// Changes the app language and persists the selection.
  ///
  /// Notifies listeners (e.g. [MaterialApp]) so the UI rebuilds
  /// with the new locale.
  Future<void> changeLanguage(String langCode) async {
    if (!supportedCodes.contains(langCode)) {
      debugPrint('[Language] Unsupported language code: $langCode');
      return;
    }

    if (langCode == currentLanguageCode) return;

    _locale = Locale(langCode);
    notifyListeners();
    debugPrint('[Language] Changed to: $langCode (${languageNames[langCode]})');

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_prefKey, langCode);
      debugPrint('[Language] Persisted language: $langCode');
    } catch (e) {
      debugPrint('[Language] Failed to persist preference: $e');
    }
  }

  /// Returns the supported locales for [MaterialApp.supportedLocales].
  static List<Locale> get supportedLocales =>
      supportedCodes.map((c) => Locale(c)).toList();
}
