import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Provides the SharedPreferences instance synchronously.
/// IMPORTANT: Override this in ProviderScope during app initialization
/// after `SharedPreferences.getInstance()` completes.
final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('sharedPreferencesProvider must be overridden');
});

/// Manages the app's current Locale.
/// Reads initial value from SharedPreferences, defaults to Locale('en').
final localeProvider = StateProvider<Locale>((ref) {
  try {
    final prefs = ref.watch(sharedPreferencesProvider);
    final savedCode = prefs.getString('selected_locale');
    if (savedCode != null && savedCode.isNotEmpty) {
      return Locale(savedCode);
    }
  } catch (_) {
    // Fallback if provider is not overridden or errors.
  }
  return const Locale('en');
});
