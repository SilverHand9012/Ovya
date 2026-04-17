import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

// ──────────────────────────────────────────────────────────────
//  Connectivity status enum
// ──────────────────────────────────────────────────────────────

/// Simplified network status used throughout the app.
enum NetworkStatus { online, offline }

// ──────────────────────────────────────────────────────────────
//  Connectivity service
// ──────────────────────────────────────────────────────────────

/// Detects and monitors network connectivity status using
/// the `connectivity_plus` plugin.
///
/// Exposes:
/// - [status]         – a broadcast stream of [NetworkStatus].
/// - [isOnline]       – one-shot check of the current connectivity.
/// - [dispose]        – tears down the internal subscription.
class ConnectivityService {
  final Connectivity _connectivity;
  late final StreamController<NetworkStatus> _controller;
  StreamSubscription<List<ConnectivityResult>>? _subscription;

  ConnectivityService({Connectivity? connectivity})
      : _connectivity = connectivity ?? Connectivity() {
    _controller = StreamController<NetworkStatus>.broadcast();
    _startListening();
  }

  // ── Public API ───────────────────────────────────────────────

  /// A broadcast stream that emits [NetworkStatus] changes.
  Stream<NetworkStatus> get status => _controller.stream;

  /// Returns `true` if the device currently has network access.
  Future<bool> get isOnline async {
    final result = await _connectivity.checkConnectivity();
    return _mapResults(result) == NetworkStatus.online;
  }

  /// Returns the current [NetworkStatus] snapshot.
  Future<NetworkStatus> get currentStatus async {
    final result = await _connectivity.checkConnectivity();
    return _mapResults(result);
  }

  /// Cleans up resources. Call when the service is no longer needed.
  void dispose() {
    _subscription?.cancel();
    _controller.close();
  }

  // ── Internals ────────────────────────────────────────────────

  void _startListening() {
    _subscription = _connectivity.onConnectivityChanged.listen(
      (results) {
        _controller.add(_mapResults(results));
      },
      onError: (Object error) {
        // If the platform stream errors, assume offline.
        _controller.add(NetworkStatus.offline);
      },
    );
  }

  /// Maps the platform result list to a single [NetworkStatus].
  ///
  /// `connectivity_plus` v6+ returns a `List<ConnectivityResult>`.
  /// We consider the device online if *any* result is not `none`.
  NetworkStatus _mapResults(List<ConnectivityResult> results) {
    final hasConnection = results.any((r) => r != ConnectivityResult.none);
    return hasConnection ? NetworkStatus.online : NetworkStatus.offline;
  }
}
