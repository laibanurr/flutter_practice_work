import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navigation_flutter/Riverpod/cart_examplw/model_class_cart_notifier.dart';

class CartScreenRiverpod extends ConsumerWidget {
  const CartScreenRiverpod({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalCartItems = ref.watch(cartProvider);
    final total = ref.watch(totalCartItemsProvider);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: totalCartItems.length,
              itemBuilder: (context, index) =>
                  ListTile(title: Text(totalCartItems[index])),
            ),
          ),
          SizedBox(height: 10),
          Text('Total Cart Items : \$$total'),
        ],
      ),
    );
  }
}
