import 'package:go_router/go_router.dart';
import 'package:navigation_flutter/screens/log_in_screen.dart';
import 'package:navigation_flutter/screens/profile_screen.dart';

final GoRouter _authRoutes = GoRouter(
  initialLocation: '/userloginscreen',
  routes: [
    GoRoute(
      path: '/userloginscreen',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(path: '/userprofilescreen' , builder: (context, state)=>ProfileScreen())
  ],
);
