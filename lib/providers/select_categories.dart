import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddNumberNotifier extends StateNotifier<int> {
  AddNumberNotifier() : super(0);

  void selectNum(int num) {

    state = num;
    state=state;
  }
}

final addNum = StateNotifierProvider<AddNumberNotifier, int>((ref) {
  return AddNumberNotifier();
});
