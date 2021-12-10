import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'bloxex5/add.dart';
import 'bloxex5/route/app_route.dart';

// void main() {
//   BlocOverrides.runZoned(
//     () => runApp(const CounterApp()),
//     blocObserver: CounterObserver(),
//   );
// }

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

void main() {
  runApp(MyApp(
    appRouter: AppRouter(),
    connectivity: Connectivity(),
  ));
}
