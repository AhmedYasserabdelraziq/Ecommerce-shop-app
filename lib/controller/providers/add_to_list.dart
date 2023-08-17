import 'package:api/model/products.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddToList extends StateNotifier<List<Product>> {
  AddToList() : super([]);

  void add(Product add) {
    if (state.contains(add)) {
      return;
    }
    state = [...state, add];
  }

  void remove(Product product) {
    if (state.contains(product)) {
      state = state.where((m) => m.id != product.id).toList();
    }
  }
}

final addList = StateNotifierProvider<AddToList, List<Product>>((ref) {
  return AddToList();
});
