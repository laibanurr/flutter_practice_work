import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navigation_flutter/Riverpod/Riverpod_demo/model_classes/product_class.dart';import 'package:navigation_flutter/Riverpod/cart_examplw/ShoppingApp/models/product_data.dart';

final productFutureProvider = FutureProvider<List<ProductRiverPod>>((ref) async{
  await Future.delayed(Duration(seconds: 5));
  return[
        ProductRiverPod(id: 'p1', name: 'Shoes', price: 49.99),
            ProductRiverPod(id: 'p2', name: 'Shoes', price: 49.99),


  ];

});