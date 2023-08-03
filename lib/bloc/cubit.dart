import 'package:api/bloc/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNumber extends Cubit<CounterState> {
  AddNumber() : super(CounterInitialState());

  static AddNumber get(context) => BlocProvider.of(context);

  int number = 1;

  void minus() {
    number--;
    emit(CounterMinusState(number));
  }

  void plus() {
    number++;
    emit(CounterPlusState(number));
  }
}
