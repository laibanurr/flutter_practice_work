import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navigation_flutter/Riverpod/cart_examplw/model_class_cart_notifier.dart';

class CartScreenRiverpod extends ConsumerWidget {
  const CartScreenRiverpod({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalCartItems = ref.watch(cartProvider);
    return Scaffold(
      body: ListView.builder(
        itemCount: totalCartItems.length,
        itemBuilder: (context, index) =>
            ListTile(title: Text(totalCartItems[index])),
      ),
    );
  }
}
