import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../features/onboarding/providers/onboarding_provider.dart';
import '../features/sanctuary/sanctuary_screen.dart';
import '../features/onboarding/presentation/welcome_screen.dart';

class RootScreen extends ConsumerWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statusAsync = ref.watch(onboardingStatusProvider);

    return statusAsync.when(
      data: (completed) {
        if (completed) {
          return const SanctuaryScreen();
        } else {
          return const WelcomeScreen();
        }
      },
      loading: () => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      error: (e, st) => Scaffold(
        body: Center(
          child: Text('Error: $e'),
        ),
      ),
    );
  }
}
