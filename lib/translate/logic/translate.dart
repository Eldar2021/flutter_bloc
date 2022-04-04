import 'package:translator/translator.dart';

class Translate1 {
  Future<String> translate1(String text) async {
    final translator = GoogleTranslator();
    final trText = await translator.translate(text, from: 'en', to: 'ky');
    print(trText);
    return trText.toString();
  }
}
