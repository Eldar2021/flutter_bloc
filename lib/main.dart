import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'blocex3/app.dart';
import 'blocex3/simple_bloc_observer.dart';

// void main() {
//   BlocOverrides.runZoned(
//     () => runApp(const CounterApp()),
//     blocObserver: CounterObserver(),
//   );
// }

// void main() {
//   runApp(const TimerApp());
// }

void main() {
  BlocOverrides.runZoned(
    () => runApp(const ListApp()),
    blocObserver: ListObserver(),
  );
}
