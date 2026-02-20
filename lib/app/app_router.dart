import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../core/ui/adaptive_navigation.dart';
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
    GoRoute(
      path: '/',
      pageBuilder: (context, state) =>
          _buildAdaptivePage(state: state, child: const _AuthWrapper()),
    ),
    GoRoute(
      path: '/timeline',
      pageBuilder: (context, state) =>
          _buildAdaptivePage(state: state, child: const TimelineScreen()),
    ),
    GoRoute(
      path: '/diary/:id',
      pageBuilder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);
        return _buildAdaptivePage(
          state: state,
          child: DiaryDetailScreen(
            diaryId: id,
            highlightQuery: state.uri.queryParameters['q'],
            matchType: state.uri.queryParameters['match'],
          ),
        );
      },
    ),
    GoRoute(
      path: '/reminders',
      pageBuilder: (context, state) =>
          _buildAdaptivePage(state: state, child: const ReminderScreen()),
    ),
    GoRoute(
      path: '/settings',
      pageBuilder: (context, state) =>
          _buildAdaptivePage(state: state, child: const SettingsScreen()),
    ),
  ],
);

Page<void> _buildAdaptivePage({
  required GoRouterState state,
  required Widget child,
}) {
  if (!kIsWeb && isCupertinoPlatform(defaultTargetPlatform)) {
    return CupertinoPage<void>(key: state.pageKey, child: child);
  }

  return MaterialPage<void>(key: state.pageKey, child: child);
}

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
