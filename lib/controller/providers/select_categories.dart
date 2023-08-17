import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddNumberNotifier extends StateNotifier<List> {
  AddNumberNotifier() : super([]);

  // void increment() {
  //   state++;
  // }
  //
  // void decrement() {
  //   state--;
  // }

  void add(int add) {
    state = [...state, add];
  }

// void reset(){
//   state = 0;
// }
}

final addNum = StateNotifierProvider<AddNumberNotifier, List>((ref) {
  return AddNumberNotifier();
});
