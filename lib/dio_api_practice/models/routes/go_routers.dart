import 'package:go_router/go_router.dart';
import 'package:navigation_flutter/dio_api_practice/models/user.dart';
import 'package:navigation_flutter/dio_api_practice/screens/details_screen.dart';
import 'package:navigation_flutter/dio_api_practice/screens/user_screen_interceptors.dart';

final GoRouter appRouterApi = GoRouter(
  initialLocation: '/firstscreen',
  routes: [
    GoRoute(
      path: '/firstscreen',
      builder: (context, state) {
        return UserScreenInterceptors();
      },
    ),
    GoRoute(path: '/detailscreen2', 
    builder: (context, state) {
      final user = state.extra as User;
      return DetailsScreenApi(user: user);
    },
    )
  ],
);
