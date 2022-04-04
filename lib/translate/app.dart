import 'package:bloc_education/translate/view/home_page.dart';
import 'package:flutter/material.dart';

class TranslateApp extends StatelessWidget {
  const TranslateApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Timer',
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(109, 234, 255, 1),
        colorScheme: const ColorScheme.light(
          secondary: Color.fromRGBO(72, 74, 126, 1),
        ),
      ),
      home: const TranslatePage(),
    );
  }
}