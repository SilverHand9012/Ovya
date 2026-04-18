import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/connectivity/connectivity_orchestrator.dart';
import '../../core/services/connectivity_service.dart';

/// Provides the singleton [ConnectivityOrchestrator].
/// Override this in [ProviderScope] if initialized in [main.dart].
final connectivityOrchestratorProvider = Provider<ConnectivityOrchestrator>((ref) {
  throw UnimplementedError('connectivityOrchestratorProvider must be overridden');
});

/// Streams true if online, false if offline.
final connectivityProvider = StreamProvider<bool>((ref) async* {
  final orchestrator = ref.watch(connectivityOrchestratorProvider);
  
  // Initial status
  final initial = await orchestrator.isOnline;
  yield initial;

  final controller = StreamController<bool>();
  
  void listener(NetworkStatus status) {
    controller.add(status == NetworkStatus.online);
  }
  
  orchestrator.addListener(listener);
  
  ref.onDispose(() {
    orchestrator.removeListener(listener);
    controller.close();
  });
  
  // Yield all further statuses
  yield* controller.stream;
});
