import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavouriteNotifier extends FamilyNotifier<bool, String> {
  @override
  bool build(String productId) {
    return false;
  }

  void toggle() {
    state = !state;
  }
}

final favoriteProvider =
    NotifierProvider.family<FavouriteNotifier, bool, String>(
      FavouriteNotifier.new,
    );
