import 'package:flutter/widgets.dart';

import '../../l10n/gen/app_localizations.dart';

// ──────────────────────────────────────────────────────────────
//  Recommendation key → localized string resolver
// ──────────────────────────────────────────────────────────────

/// Maps each recommendation key emitted by [DetectionEngine] to its
/// localized user-facing string via [AppLocalizations].
///
/// Usage in a widget:
/// ```dart
/// final strings = resolveRecommendations(context, riskResult.recommendations);
/// ```
///
/// If a key has no matching ARB entry, the raw key is returned as a
/// fallback so the UI never shows a blank line.
List<String> resolveRecommendations(
  BuildContext context,
  List<String> keys,
) {
  final l10n = AppLocalizations.of(context);
  if (l10n == null) return keys;

  final Map<String, String> table = {
    'rec_track_regularly': l10n.rec_track_regularly,
    'rec_balanced_diet': l10n.rec_balanced_diet,
    'rec_schedule_checkup': l10n.rec_schedule_checkup,
    'rec_monitor_cycle': l10n.rec_monitor_cycle,
    'rec_stress_management': l10n.rec_stress_management,
    'rec_consult_gynecologist': l10n.rec_consult_gynecologist,
    'rec_request_bloodwork': l10n.rec_request_bloodwork,
    'rec_symptom_diary': l10n.rec_symptom_diary,
  };

  return keys.map((key) => table[key] ?? key).toList();
}
