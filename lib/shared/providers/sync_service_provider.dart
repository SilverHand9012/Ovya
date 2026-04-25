import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/sync/sync_service.dart';

import 'connectivity_provider.dart';

final syncServiceProvider = Provider<SyncService>((ref) {
  final orchestrator = ref.watch(connectivityOrchestratorProvider);
  final service = SyncService(
    ref: ref,
    orchestrator: orchestrator,
  );
  service.start();
  ref.onDispose(() => service.stop());
  return service;
});
