import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../features/auth/presentation/controllers/auth_controller.dart';
import '../features/auth/presentation/screens/setup_screen.dart';
import '../features/diary/presentation/screens/timeline_screen.dart';
import '../features/diary/presentation/screens/diary_detail_screen.dart';
import '../features/reminder/presentation/screens/reminder_screen.dart';
import '../features/settings/presentation/settings_screen.dart';

final routerProvider = GoRouter(
  initialLocation: '/',
  redirect: (context, state) {
    // This is handled by AuthRouter widget
    return null;
  },
  routes: [
    GoRoute(path: '/', builder: (context, state) => const _AuthWrapper()),
    GoRoute(
      path: '/timeline',
      builder: (context, state) => const TimelineScreen(),
    ),
    GoRoute(
      path: '/diary/:id',
      builder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);
        return DiaryDetailScreen(
          diaryId: id,
          highlightQuery: state.uri.queryParameters['q'],
          matchType: state.uri.queryParameters['match'],
        );
      },
    ),
    GoRoute(
      path: '/reminders',
      builder: (context, state) => const ReminderScreen(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    ),
  ],
);

/// Wrapper that checks auth state and redirects
class _AuthWrapper extends ConsumerWidget {
  const _AuthWrapper();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.watch(authProvider);

    if (userId == null) {
      // No user, show setup
      return const SetupScreen();
    }

    // Has user, go to timeline
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.go('/timeline');
    });

    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
