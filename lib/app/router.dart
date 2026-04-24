import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

import '../features/auth/presentation/auth_screen.dart';
import '../features/onboarding/presentation/onboarding_screen.dart';
import '../features/results/results_screen.dart';
import '../features/log/log_screen.dart';
import 'home_shell.dart';
import 'app_scaffold.dart';

/// Application router configuration using GoRouter.
final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  redirect: (context, state) async {
    final prefs = await SharedPreferences.getInstance();
    final user = FirebaseAuth.instance.currentUser;
    final isAuthRoute = state.uri.path == '/auth';
    final isOnboardingRoute = state.uri.path == '/onboarding';

    // If they haven't finished onboarding, don't trap them inside Auth unexpectedly
    if (!prefs.containsKey('selected_language') && !isOnboardingRoute) {
      return '/onboarding';
    }

    if (user == null && !isAuthRoute && !isOnboardingRoute) {
      return '/auth';
    }

    if (user != null && isAuthRoute) {
      return '/';
    }

    return null;
  },
  routes: [
    GoRoute(
      path: '/onboarding',
      name: 'onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: '/auth',
      name: 'auth',
      builder: (context, state) => const AuthScreen(),
    ),

    // ── Overlay routes (slide/fade over the main shell) ──────────
    GoRoute(
      path: '/results',
      name: 'results',
      pageBuilder: (context, state) => CustomTransitionPage(
        child: const ResultsScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
              .animate(CurvedAnimation(parent: animation, curve: Curves.easeOutCubic)),
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 380),
      ),
    ),
    GoRoute(
      path: '/log',
      name: 'log',
      pageBuilder: (context, state) => CustomTransitionPage(
        child: const LogScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: CurvedAnimation(parent: animation, curve: Curves.easeIn),
            child: SlideTransition(
              position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
                .animate(CurvedAnimation(parent: animation, curve: Curves.easeOutCubic)),
              child: child,
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 300),
      ),
    ),

    // ── Main shell: IndexedStack bottom nav ──────────────────────
    ShellRoute(
      builder: (context, state, child) => AppScaffold(child: child),
      routes: [
        GoRoute(
          path: '/',
          name: 'home',
          builder: (context, state) => const HomeShell(),
        ),
      ],
    ),
  ],
);
