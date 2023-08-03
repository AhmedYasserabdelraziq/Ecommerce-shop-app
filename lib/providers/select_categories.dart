import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddNumberNotifier extends StateNotifier<int> {
  AddNumberNotifier() : super(1);

  // void increment() {
  //   state++;
  // }
  //
  // void decrement() {
  //   state--;
  // }

  void selectNum(int num) {
    state = num;
  }
  // void reset(){
  //   state = 0;
  // }
}

final addNum = StateNotifierProvider<AddNumberNotifier, int>((ref) {
  return AddNumberNotifier();
});
