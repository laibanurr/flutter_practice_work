import 'package:go_router/go_router.dart';
import 'package:navigation_flutter/screens/appshellroute.dart';
import 'package:navigation_flutter/screens/counter_display_screen.dart';
import 'package:navigation_flutter/screens/counter_screen.dart';
import 'package:navigation_flutter/screens/pageA.dart';
import 'package:navigation_flutter/screens/pageB.dart';
import 'package:navigation_flutter/screens/userpage.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/counterDisplay',
  routes: [
    // ── OLD: plain ShellRoute version (Exercise 5) ─────────────
    // Kept for reference. Not active — StatefulShellRoute below replaces it.
    //
    // ShellRoute(
    //   builder: (context, state, child) {
    //     return ShellWidget(child: child);
    //   },
    //   routes: [
    //     GoRoute(path: '/', builder: (context, state) => PgeA()),
    //     GoRoute(path: '/b', builder: (context, state) => const PageB()),
    //     GoRoute(path: '/counterDisplay', builder: (context, state) => CounterDisplayScreen()),
    //   ],
    // ),

    // ── Routes that don't need the bottom nav shell ─────────────
    GoRoute(path: '/', builder: (context, state) => PgeA()),
    GoRoute(
      path: '/user/:username/:age',
      name: 'userPage',
      builder: (context, state) {
        final username = state.pathParameters['username']!;
        final age = state.pathParameters['age']!;
        return UserPage(username: username, age: age);
      },
    ),
    GoRoute(
      path: '/counterScreen',
      builder: (context, state) {
        final receivedCount = state.extra as int;
        return CounterScreen(count: receivedCount);
      },
    ),

    // ── NEW: StatefulShellRoute (Exercise 6, current) ───────────
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return Appshellroute(navishell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(path: '/counterDisplay', builder: (context, state) => const CounterDisplayScreen()),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(path: '/b', builder: (context, state) => const PageB()),
          ],
        ),
      ],
    ),
  ],
);