import 'package:flutter/material.dart';
import 'package:navigation_flutter/provider_practice/cart/cart_model.dart';
import 'package:navigation_flutter/provider_practice/cart/cart_screen.dart';
import 'package:provider/provider.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Helper function to navigate to the cart screen
    void navigateToCart() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CartScreen()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products List'),
        centerTitle: false,
        actions: [
          Consumer<CartModel>(
            builder: (context, cart, child) {
              return IconButton(
                onPressed: navigateToCart, // Added tap functionality to the icon
                icon: Badge(
                  label: Text('${cart.itemCount}'),
                  child: const Icon(Icons.shopping_cart),
                ),
              );
            },
          ),
          const SizedBox(width: 16), // Gives the action icon some breathing room
        ],
      ),
      body: Column(
        children: [
          // FIX: Wrapped in Expanded so ListView takes up only the available vertical space
          Expanded(
            child: ListView(
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
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(16.0), // Optional: Adds clean spacing around the button
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: navigateToCart,
                child: const Text('Show Cart'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
