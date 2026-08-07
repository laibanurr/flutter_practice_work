// in your go_router file
import 'package:go_router/go_router.dart';
import 'package:navigation_flutter/auth/screens/login_screen.dart';
import 'package:navigation_flutter/auth/screens/profile_screen.dart';
import 'package:navigation_flutter/auth/services/auth_service.dart';

final authService = AuthService(); // ONE instance, created once

final GoRouter authRouterApi = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) =>
      UserLoginScreen(authservice: authService)
    ),
    GoRoute(
      path: '/userprofilescreen',
      builder: (context, state) => UserProfileScreen(authService: authService),
    ),
  ],
);