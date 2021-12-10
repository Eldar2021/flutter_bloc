part of 'counter_cubit.dart';

class CounterState {
  final int counter;
  final bool? wasIncrement;

  const CounterState({
    required this.counter,
    this.wasIncrement,
  });
}
