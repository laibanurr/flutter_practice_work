import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartNotifier extends Notifier<List<String>> {
  @override
  List<String> build() {
    return [];
  }

  void addItem(String item) {
    state = [...state, item];
  }
}

final cartProvider = NotifierProvider<CartNotifier, List<String>>(
  () => CartNotifier(),
);
final totalCartItemsProvider = Provider<int>((ref) {
  final cart = ref.watch(cartProvider);
  return cart.length;
});
