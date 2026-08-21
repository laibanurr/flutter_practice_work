class CartState {
  final List<String> items;
  final bool isLoading;
  final String? discountCode;

  CartState({this.items = const [], this.isLoading = false, this.discountCode});
  CartState copyWith({
    List<String>? items,
    bool? isLoading,
    String? discountCode,
  }) {
    return CartState(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
      discountCode: discountCode ?? this.discountCode,
    );
  }
}
