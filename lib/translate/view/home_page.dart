import 'package:bloc_education/translate/logic/cubit/translate_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TranslatePage extends StatefulWidget {
  const TranslatePage({Key? key}) : super(key: key);

  @override
  _TranslatePageState createState() => _TranslatePageState();
}

class _TranslatePageState extends State<TranslatePage> {
  // String appBatText = "Kimsin?";
  // String boduText = "Кыргызстан";
  // final Translate1 translate1 = Translate1();

  List<String> locales = ['ky', 'tr', 'ru', 'ko', 'uz', 'en'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.watch<TranslateCubit>().state.texts[0]),
      ),
      body: Center(child: Text(context.watch<TranslateCubit>().state.texts[1])),
      floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: locales
              .map(
                (e) => FloatingActionButton(
                  child: Text(e),
                  onPressed: () async {
                    await context.read<TranslateCubit>().translate(e);
                  },
                ),
              )
              .toList()),
    );
  }
}
