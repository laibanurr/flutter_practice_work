import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navigation_flutter/Riverpod/Riverpod_demo/Future/future_provider.dart';

class FutureProviderScreen extends ConsumerWidget {
  const FutureProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsync = ref.watch(productFutureProvider);
    return Scaffold(
      body: productAsync.when(
        error: (error, StackTrace) {
          Center(child: Text('something went wrong : $error'));
        },
        loading: () {
          Center(child: CircularProgressIndicator());
        },
        data: (products) => ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ListTile(title: Text(products[index].name));
          },
        ),
      ),
    );
  }
}
