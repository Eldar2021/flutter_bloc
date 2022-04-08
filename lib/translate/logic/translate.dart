import 'package:flutter/foundation.dart';
import 'package:translator/translator.dart';

class Translate1 {
  Future<String> translate1(String text, String to) async {
    final translator = GoogleTranslator();
    final trText = await translator.translate(text, to: to);
    debugPrint(trText.toString());
    return trText.toString();
  }
}
