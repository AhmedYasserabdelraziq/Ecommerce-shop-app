abstract class CounterState {}

class CounterInitialState extends CounterState {

}

class CounterMinusState extends CounterState {
final int num;
CounterMinusState(this.num);
}

class CounterPlusState extends CounterState {
  final int num;
  CounterPlusState(this.num);
}
