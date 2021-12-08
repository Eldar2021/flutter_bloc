import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'blocex1/app.dart';
import 'blocex1/counter_observer.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(const CounterApp()),
    blocObserver: CounterObserver(),
  );
}

// void main() {
//   runApp(const TimerApp());
// }

// void main() {
//   BlocOverrides.runZoned(
//     () => runApp(const ListApp()),
//     blocObserver: ListObserver(),
//   );
// }

// void main() {
//   runApp(App(
//     authenticationRepository: AuthenticationRepository(),
//     userRepository: UserRepository(),
//   ));
// }
