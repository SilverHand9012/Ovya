import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/sync_status_provider.dart';

// ──────────────────────────────────────────────────────────────
//  Sync status banner
// ──────────────────────────────────────────────────────────────

/// A small animated banner that shows the current sync status.
///
/// Displays:
/// - 🔴 "Offline mode active" — when device has no connectivity.
/// - 🔄 "Syncing data…" — when data is being pushed to server.
/// - ✅ "Synced successfully" — briefly shown after sync completes.
/// - Hidden — when online and idle (nothing to report).
class SyncStatusBanner extends ConsumerWidget {
  const SyncStatusBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(syncStatusProvider);

    String text;
    switch (status) {
      case SyncStatus.offline:
        text = "Offline mode";
        break;
      case SyncStatus.syncing:
        text = "Syncing...";
        break;
      case SyncStatus.synced:
        text = "Synced";
        break;
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      color: Colors.black87,
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }
}

// ──────────────────────────────────────────────────────────────
//  AI status banner
// ──────────────────────────────────────────────────────────────

/// Shows the current AI insight fetch status.
///
/// Displays:
/// - "Fetching new insights…" — while loading.
/// - "Using last saved insights" — when showing cached data.
/// - "We're offline. Showing your last insights." — when offline
///   with cached insight.
class AiStatusBanner extends ConsumerWidget {
  final bool isLoading;
  final bool isFromCache;

  const AiStatusBanner({
    super.key,
    required this.isLoading,
    required this.isFromCache,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final syncStatus = ref.watch(syncStatusProvider);
    final isOffline = syncStatus == SyncStatus.offline;

    if (!isLoading && !isFromCache && !isOffline) {
      return const SizedBox.shrink();
    }

    final (icon, label, color) = isLoading
        ? (Icons.auto_awesome, 'Fetching new insights…', Colors.blue)
        : isOffline && isFromCache
            ? (Icons.cloud_off, "We're offline. Showing your last insights.",
                Colors.orange)
            : isFromCache
                ? (Icons.cached, 'Using last saved insights', Colors.amber)
                : (Icons.auto_awesome, '', Colors.blue);

    if (label.isEmpty) return const SizedBox.shrink();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        border: Border(
          bottom: BorderSide(color: color.withValues(alpha: 0.25)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isLoading
              ? SizedBox(
                  width: 14,
                  height: 14,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: color,
                  ),
                )
              : Icon(icon, size: 16, color: color),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              label,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
