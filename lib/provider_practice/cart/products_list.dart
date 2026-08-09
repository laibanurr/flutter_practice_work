import 'package:flutter/material.dart';
import 'package:navigation_flutter/provider_practice/cart/cart_model.dart';
import 'package:provider/provider.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Products List'), centerTitle: false),
      body: ListView(
        children: ['Shoes', 'bags', 'jewelery'].map((product) {
          return ListTile(
            title: Text(product),
            trailing: ElevatedButton(
              onPressed: () {
                context.read<CartModel>().addItems(product);
              },
              child: const Text('Add'),
            ),
          );
        }).toList(),
      ),
    );
  }
}
