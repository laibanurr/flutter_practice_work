import 'package:go_router/go_router.dart';
import 'package:navigation_flutter/auth/screens/login_screen.dart';
import 'package:navigation_flutter/auth/screens/profile_screen.dart';

final GoRouter authRoutes = GoRouter(
  initialLocation: '/userloginscreen',
  routes: [
    GoRoute(
      path: '/userloginscreen',
      builder: (context, state) => const UserLoginScreen(),
    ),
    GoRoute(path: '/userprofilescreen' , builder: (context, state)=>UserProfileScreen())
  ],
);
