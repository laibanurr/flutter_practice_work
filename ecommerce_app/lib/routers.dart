import 'package:ecommerce_app/products/model/product_model.dart';
import 'package:ecommerce_app/products/screens/product_detail_screen.dart';
import 'package:ecommerce_app/products/screens/products_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'products',
      builder: (context, state) {
        return const ProductScreen();
      },
    ),
    GoRoute(
      path: '/details',
      name: 'details',
      builder: (context, state) {
        final Product selectedProduct = state.extra as Product;
        return ProductDetailScreen(product: selectedProduct);
      },
    ),
  ],
);
