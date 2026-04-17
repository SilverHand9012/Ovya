import 'package:go_router/go_router.dart';

import '../features/symptom_tracking/presentation/log_screen.dart';
import '../features/ai_insights/presentation/insights_screen.dart';

/// Application router configuration using GoRouter.
final GoRouter appRouter = GoRouter(
  initialLocation: '/log',
  routes: [
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
  ],
);
