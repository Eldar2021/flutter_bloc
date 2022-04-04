import 'package:bloc_education/blocex1/counter/cubit/counter_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
//import 'package:flutter_test/flutter_test.dart';
//import 'package:test/test.dart';

void main() {
  test('counter increment', () {
    final counter = CounterCubit();
    counter.increment();
    expect(counter.state, 1);
  });

  test("counter decrement", (){
    final counter = CounterCubit();
    counter.decrement();
    expect(counter.state, -1);
  });
}
