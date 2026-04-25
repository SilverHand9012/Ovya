import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../shared/providers/connectivity_provider.dart';

/// Wraps all main application routes.
/// Slides down a global banner when the device goes offline.
class AppScaffold extends ConsumerWidget {
  final Widget child;

  const AppScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch online status — default to true to avoid flashing offline initially
    final isOnline = ref.watch(connectivityProvider).valueOrNull ?? true;
    final isOffline = !isOnline;

    return Scaffold(
      body: Column(
        children: [
          AnimatedSize(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOutCubic,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              transitionBuilder: (child, animation) {
                final offsetAnimation = Tween<Offset>(
                  begin: const Offset(0.0, -1.0),
                  end: Offset.zero,
                ).animate(animation);
                return ClipRect(
                  child: SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  ),
                );
              },
              child: isOffline
                  ? Container(
                      key: const ValueKey('offline_banner'),
                      width: double.infinity,
                      color: Theme.of(context).colorScheme.secondary, // Theme based fallback
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top + 12,
                        bottom: 12,
                        left: 16,
                        right: 16,
                      ),
                      child: const Text(
                        "You're offline — data will sync when connected",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(key: ValueKey('online_state')),
            ),
          ),
          Expanded(child: child),
        ],
      ),
    );
  }
}
