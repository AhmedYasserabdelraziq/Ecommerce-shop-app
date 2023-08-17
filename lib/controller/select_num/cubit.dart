import 'package:api/controller/select_num/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNumber extends Cubit<CounterState> {
  AddNumber() : super(CounterInitialState());

  static AddNumber get(context) => BlocProvider.of(context);

  int number=0;

 setNumber(int num){
  num=number;
}
  void minus() {
    number--;
    emit(CounterMinusState(number));
  }

  void plus() {
    number++;
    emit(CounterPlusState(number));
  }
}
