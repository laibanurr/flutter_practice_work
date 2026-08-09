import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List<String> _items = [];
  List<String> get items => _items;
  int get itemCount => _items.length;

  void addItems(String item) {
    _items.add(item);
    notifyListeners();
  }
}
