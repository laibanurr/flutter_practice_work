import 'package:flutter/material.dart';
import 'package:navigation_flutter/provider_practice/cart/cart_model.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (context , index)=>ListTile(
          title: Text(cart.items[index]),
        )
        ),
    );
  }
}
