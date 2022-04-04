import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'my_mask.dart';

class TextFieldFormat extends StatefulWidget {
  const TextFieldFormat({Key? key}) : super(key: key);

  @override
  _TextFieldFormatState createState() => _TextFieldFormatState();
}

class _TextFieldFormatState extends State<TextFieldFormat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: TextFormField(
          inputFormatters: [maskCode],

        ),
      ),
    );
  }
}

final maskCode = MyMask(
  mask: '#-#-#-#',
  filter: {"#": RegExp(r'[0-9]')},
);

final myMask = MyMask();
