import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navigation_flutter/Riverpod/Riverpod_demo/model_classes/cart_notifier.dart';

class NewCartScreen extends ConsumerWidget {
  const NewCartScreen({super.key});

  @override
  Widget build(BuildContext context , WidgetRef ref) {
    final myCartItems = ref.watch(cartProvider2);
    final total = ref.watch(totalCartProvider2);
    return Scaffold(
      appBar: AppBar(title: Text('CART SCREEEEEEEN'),),
       body: Center(
        child: Column(
          children: [Expanded(
            child: ListView.builder(
              itemCount: myCartItems.items.length,
              itemBuilder: (context , index){
                return ListTile(
                  title: Text(myCartItems.items[index]),);
              
              })),
              
              SizedBox(height: 20,),
              SizedBox(width: double.infinity,
              child: Text('$total'),)
              
              ],
        ),
       ),
    );
  }
}