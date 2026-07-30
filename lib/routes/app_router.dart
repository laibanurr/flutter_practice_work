import 'package:go_router/go_router.dart';
import 'package:navigation_flutter/screens/counter_display_screen.dart';
import 'package:navigation_flutter/screens/counter_screen.dart';
import 'package:navigation_flutter/screens/pageA.dart';
import 'package:navigation_flutter/screens/pageB.dart';
import 'package:navigation_flutter/screens/userpage.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/counterDisplay',
  routes: [
    GoRoute(path: '/', builder: (context, state) => PgeA()),
    GoRoute(path: '/b', builder: (context, state) => const PageB()),
    GoRoute(
      path: '/user/:username/:age',
      builder: (context, state) {
        final username = state.pathParameters['username']!;
        final age = state.pathParameters['age']!;

        return UserPage(username: username, age: age);
      },
    ),
    GoRoute(
      path: '/counterDisplay',
      builder: (context, state) => CounterDisplayScreen(),
    ),
    GoRoute(
      path: '/counterScreen',
      builder: (context, state) {
        final receivedCount = state.extra as int;
        return CounterScreen(count: receivedCount);
      },
    ),
  ],
);
