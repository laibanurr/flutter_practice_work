import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navigation_flutter/Riverpod/Riverpod_demo/model_classes/cart_notifier.dart';
import 'package:navigation_flutter/Riverpod/Riverpod_demo/model_classes/fav_notifier.dart';
import 'package:navigation_flutter/Riverpod/Riverpod_demo/model_classes/product_class.dart';
import 'package:navigation_flutter/Riverpod/Riverpod_demo/screens/new_cart_screen.dart';

class ProductDisplayScreen extends ConsumerWidget {
  ProductDisplayScreen({super.key});

  final List<ProductRiverPod> productsList = [
    ProductRiverPod(id: 'p1', name: 'shopping bag', price: 56.99),
    ProductRiverPod(id: 'p2', name: 'shoes', price: 1000.0),
    ProductRiverPod(id: 'p3', name: 'laptop', price: 5000.00),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Display Screen'),
        actions: [
          Consumer(
            builder: (context, ref, child) {
              final cartItems = ref.watch(cartProvider2);
              return Badge(
                label: Text('${cartItems.items.length}'),
                child: Icon(Icons.shopping_cart),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Center(
          child: Column(
            mainAxisAlignment: .center,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: productsList.length,
                  itemBuilder: (context, index) {
                    final productsIndex = productsList[index];
                    final isFavourited = ref.watch(
                      favoriteProvider(productsIndex.id),
                    );
                    return ListTile(
                      leading: Text(productsIndex.name),
                      subtitle: Text('\$ ${productsIndex.price}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(
                              isFavourited
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                            ),
                            onPressed: () => ref
                                .read(
                                  favoriteProvider(productsIndex.id).notifier,
                                )
                                .toggle(),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () => ref
                                .read(cartProvider2.notifier)
                                .addItem(productsIndex.name),
                          ),
                        ],
                      ),
                    
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewCartScreen()),
                    );
                  },
                  child: Text('show my cart items '),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
