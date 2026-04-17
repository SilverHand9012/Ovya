import 'package:flutter_riverpod/flutter_riverpod.dart';

enum SyncStatus {
  offline,
  syncing,
  synced,
}

final syncStatusProvider = StateProvider<SyncStatus>((ref) {
  return SyncStatus.synced;
});
