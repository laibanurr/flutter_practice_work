import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navigation_flutter/Riverpod/Riverpod_demo/model_classes/cart_state.dart';

class CartNotifier extends Notifier<CartState> {
  @override
  CartState build() {
    return CartState();
  }

  void addItem(String item) {
    state = state.copyWith(items: [...state.items, item]);
  }

  void setLoading(bool loading) {
    state = state.copyWith(isLoading: loading);
  }

  void applyDiscount(String code) {
    state = state.copyWith(discountCode: code);
  }
}

final cartProvider2 = NotifierProvider<CartNotifier, CartState>(
  () => CartNotifier(),
);
final totalCartProvider2 = Provider<int>((ref) {
  final cart = ref.watch(cartProvider2);
  return cart.items.length;
});
