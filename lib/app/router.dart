import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

import '../features/auth/presentation/auth_screen.dart';
import '../features/auth/presentation/login_screen.dart';
import '../features/auth/presentation/signup_screen.dart';
import '../features/onboarding/presentation/onboarding_screen.dart';
import '../features/results/results_screen.dart';
import '../features/log/log_screen.dart';
import '../features/chat/presentation/chat_screen.dart';
import '../features/reports/presentation/report_screen.dart';
import '../features/history/history_screen.dart';
import '../features/cycle_tracking/presentation/cycle_screen.dart';
import '../features/sanctuary/sanctuary_screen.dart';
import 'app_scaffold.dart';

/// Application router configuration using GoRouter.
final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  redirect: (context, state) async {
    final prefs = await SharedPreferences.getInstance();
    final user = FirebaseAuth.instance.currentUser;

    final isGuest = prefs.getBool('is_guest') ?? false;
    final hasLanguage = prefs.containsKey('selected_language');
    final isLoggedIn = user != null || isGuest;

    final path = state.uri.path;
    final isAuthRelatedRoute = path == '/auth' || path == '/login' || path == '/signup';
    final isOnboardingRoute = path == '/onboarding';

    // 1. Must select language first
    if (!hasLanguage && !isOnboardingRoute) {
      return '/onboarding';
    }

    // 2. If has language, but not logged in, must be on an auth-related route
    if (hasLanguage && !isLoggedIn && !isAuthRelatedRoute && !isOnboardingRoute) {
      return '/auth';
    }

    // 3. If has language and logged in, cannot go to onboarding or auth-related routes
    if (hasLanguage && isLoggedIn && (isAuthRelatedRoute || isOnboardingRoute)) {
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
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/signup',
      name: 'signup',
      builder: (context, state) => const SignupScreen(),
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
    GoRoute(
      path: '/report',
      name: 'report',
      pageBuilder: (context, state) => CustomTransitionPage(
        child: const ReportScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final curved = CurvedAnimation(parent: animation, curve: Curves.easeOutCubic);
          return FadeTransition(
            opacity: curved,
            child: ScaleTransition(
              scale: Tween<double>(begin: 0.92, end: 1.0).animate(curved),
              child: child,
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 350),
      ),
    ),
    GoRoute(
      path: '/chat',
      name: 'chat',
      pageBuilder: (context, state) => CustomTransitionPage(
        child: const ChatScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final curved = CurvedAnimation(parent: animation, curve: Curves.easeOutCubic);
          return FadeTransition(
            opacity: curved,
            child: ScaleTransition(
              scale: Tween<double>(begin: 0.92, end: 1.0).animate(curved),
              child: child,
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 350),
      ),
    ),
    GoRoute(
      path: '/history',
      name: 'history',
      pageBuilder: (context, state) => CustomTransitionPage(
        child: const HistoryScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final curved = CurvedAnimation(parent: animation, curve: Curves.easeOutCubic);
          return FadeTransition(
            opacity: curved,
            child: ScaleTransition(
              scale: Tween<double>(begin: 0.92, end: 1.0).animate(curved),
              child: child,
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 350),
      ),
    ),
    GoRoute(
      path: '/cycle',
      name: 'cycle',
      pageBuilder: (context, state) => CustomTransitionPage(
        child: const CycleScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final curved = CurvedAnimation(parent: animation, curve: Curves.easeOutCubic);
          return FadeTransition(
            opacity: curved,
            child: ScaleTransition(
              scale: Tween<double>(begin: 0.92, end: 1.0).animate(curved),
              child: child,
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 350),
      ),
    ),

    // ── Main shell: AppScaffold (offline banner) ──────────────────
    ShellRoute(
      builder: (context, state, child) => AppScaffold(child: child),
      routes: [
        GoRoute(
          path: '/',
          name: 'home',
          builder: (context, state) => const SanctuaryScreen(),
        ),
      ],
    ),
  ],
);
