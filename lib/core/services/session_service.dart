import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Centralized service for managing user session data cleanup.
///
/// Ensures complete data wipe on logout while preserving
/// global app settings (language, device ID).
///
/// Keys preserved across sessions (NOT user-specific):
///   - `selected_language` — app language preference
///   - `selected_locale`  — locale provider cache
///   - `ovya_device_id`   — persistent device identifier
class SessionService {
  SessionService._();

  /// User-specific SharedPreferences keys that MUST be cleared on logout.
  ///
  /// These are either fixed keys or prefix patterns.
  static const List<String> _fixedUserKeys = [
    'is_guest',
    'guest_user_id',
    'user_name',
    'chat_last_question',
    'pending_sync_confirmation',
    'last_sync_count',
    'last_sync_time',
  ];

  /// Prefixes for dynamically-named user keys (e.g. `has_completed_assessment_<uid>`).
  static const List<String> _userKeyPrefixes = [
    'has_completed_assessment_',
    'patient_name_',
  ];

  /// Clears all user-specific data from SharedPreferences.
  ///
  /// Call this during logout AFTER the Isar database has been wiped.
  /// Global settings (language, device ID) are intentionally preserved.
  static Future<void> clearUserSession() async {
    final prefs = await SharedPreferences.getInstance();

    // 1. Remove fixed user keys
    for (final key in _fixedUserKeys) {
      await prefs.remove(key);
    }

    // 2. Remove dynamically-named keys by prefix scan
    final allKeys = prefs.getKeys();
    for (final key in allKeys) {
      for (final prefix in _userKeyPrefixes) {
        if (key.startsWith(prefix)) {
          await prefs.remove(key);
          break;
        }
      }
    }

    debugPrint('[Session] User session data cleared (${_fixedUserKeys.length} fixed keys + prefix scan)');
  }
}
