import 'package:bloc_education/translate/logic/cubit/translate_cubit.dart';
import 'package:bloc_education/translate/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TranslateApp extends StatelessWidget {
  const TranslateApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Timer',
      theme: ThemeData.dark(),
      home: BlocProvider(
        create: (context) => TranslateCubit(['Kimsin', 'Кыргызстан']),
        child: const TranslatePage(),
      ),
    );
  }
}
