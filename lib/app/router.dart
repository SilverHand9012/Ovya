import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/auth/presentation/auth_screen.dart';
import '../features/home/presentation/home_screen.dart';
import '../features/chat/presentation/chat_screen.dart';
import '../features/symptom_tracking/presentation/log_screen.dart';
import '../features/ai_insights/presentation/insights_screen.dart';
import '../features/onboarding/presentation/onboarding_screen.dart';
import '../features/reports/presentation/report_screen.dart';
import '../features/detection/presentation/detection_screen.dart';
import '../features/detection/presentation/result_screen.dart';
import 'app_scaffold.dart';

/// Application router configuration using GoRouter.
final GoRouter appRouter = GoRouter(
  initialLocation: '/onboarding',
  redirect: (context, state) async {
    if (state.uri.path == '/onboarding') {
      final prefs = await SharedPreferences.getInstance();
      if (prefs.containsKey('selected_locale')) {
        return '/home';
      }
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
    ShellRoute(
      builder: (context, state, child) => AppScaffold(child: child),
      routes: [
        GoRoute(
          path: '/home',
          name: 'home',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '/tracker',
          name: 'tracker',
          builder: (context, state) => const LogScreen(),
        ),
        GoRoute(
          path: '/log',
          name: 'log',
          builder: (context, state) => const LogScreen(),
        ),
        GoRoute(
          path: '/insights',
          name: 'insights',
          builder: (context, state) => const InsightsScreen(),
        ),
        GoRoute(
          path: '/detection',
          name: 'detection',
          builder: (context, state) => const DetectionScreen(),
        ),
        GoRoute(
          path: '/detection_result',
          name: 'detection_result',
          builder: (context, state) => const ResultScreen(),
        ),
        GoRoute(
          path: '/report',
          name: 'report',
          builder: (context, state) => const ReportScreen(),
        ),
      ],
    ),
  ],
);

