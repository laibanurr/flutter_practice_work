import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navigation_flutter/Riverpod/cart_examplw/cart_screen_riverpod.dart';
import 'package:navigation_flutter/Riverpod/cart_examplw/model_class_cart_notifier.dart';
import 'package:navigation_flutter/provider_practice/cart/cart_screen.dart';

class ProductScreen extends ConsumerWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('productssssssss....'),
        actions: [
          Consumer(
            builder: (context, ref, child) {
              final cartItems = ref.watch(cartProvider);
              return Badge(
                label: Text('${cartItems.length}'),
                child: Icon(Icons.shopping_cart),
              );
            },
          ),
          SizedBox(width: 10),
        ],
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: ['bags', 'shoes', 'jewelery'].map((product) {
                return ListTile(
                  title: Text(product),
                  trailing: ElevatedButton(
                    onPressed: () {
                      ref.read(cartProvider.notifier).addItem(product);
                    },
                    child: Text('Add to cart'),
                  ),
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartScreenRiverpod()),
                );
              },
              child: Text('Show cart screen'),
            ),
          ),
        ],
      ),
    );
  }
}
