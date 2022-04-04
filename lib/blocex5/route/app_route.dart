import 'package:bloc_education/blocex5/presentation/screens/home_screen.dart';
import 'package:bloc_education/blocex5/presentation/screens/second_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(
            color: Colors.deepOrange,
            title: "HomePage",
          ),
        );
      case "/second":
        return MaterialPageRoute(
          builder: (_) => const SecondScreen(),
        );

      default:
        return null;
    }
  }
}
