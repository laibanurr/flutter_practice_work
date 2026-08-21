import 'package:ecommerce_app/cart/screen/cart_screen.dart';
import 'package:ecommerce_app/features/screens/login_screen.dart';
import 'package:ecommerce_app/features/services/auth_service.dart';
import 'package:ecommerce_app/products/screens/product_detail_screen.dart';
import 'package:ecommerce_app/products/screens/products_screen.dart';
import 'package:go_router/go_router.dart';

final authService = AuthService();// same authService instance

final GoRouter router = GoRouter(
  initialLocation: '/login',
  redirect: (context, state) {
    final isLoggedIn = authService.accessToken != null;
    final isOnLogin = state.matchedLocation == '/login';
    if (isLoggedIn && isOnLogin) return '/products';
    if (!isLoggedIn && !isOnLogin) return '/login';
    return null;
  },
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginScreen(authService: authService),
    ),
    GoRoute(
      path: '/products',
      builder: (context, state) => const ProductsScreen(),
    ),
    GoRoute(
      path: '/product/:id',
      builder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);
        return ProductDetailScreen(productId: id);
      },
    ),
    GoRoute(path: '/cart', builder: (context, state) => CartScreen(authService: authService))
  ],
);
