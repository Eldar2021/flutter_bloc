import 'package:bloc_education/translate/logic/translate.dart';
import 'package:flutter/material.dart';

class TranslatePage extends StatefulWidget {
  const TranslatePage({Key? key}) : super(key: key);

  @override
  _TranslatePageState createState() => _TranslatePageState();
}

class _TranslatePageState extends State<TranslatePage> {
  String appBatText = "I love Eldiyar";
  final Translate1 translate1 = Translate1();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBatText),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          appBatText = await translate1.translate1(appBatText);
          setState(() {

          });
        },
      ),
    );
  }
}
