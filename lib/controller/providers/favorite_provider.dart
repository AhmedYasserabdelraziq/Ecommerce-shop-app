import 'package:api/model/products.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class FavoriteMealNotifier extends StateNotifier<List<Product>> {
  FavoriteMealNotifier() : super([]);

  bool toggleMealFavoriteStatus(Product product) {
    final isExisting = state.contains(product);

    if (isExisting) {
      state = state.where((m) => m.id != product.id).toList();
      return false;
    } else {
      state = [...state, product];
      return true;
    }
  }
}

final favoriteMealProvider =
    StateNotifierProvider<FavoriteMealNotifier, List<Product>>((ref) {
  return FavoriteMealNotifier();
});
