import 'package:bloc/bloc.dart';

import '../translate.dart';

part 'translate_state.dart';

class TranslateCubit extends Cubit<TranslateState> {
  TranslateCubit(this.texts) : super(TranslateState(texts));
  final List<String> texts;
  final Translate1 translate1 = Translate1();

  Future<void> translate(String to) async {
    for (int i = 0; i < texts.length; i++) {
      String newText = await translate1.translate1(texts[i], to);
      texts.replaceRange(i, i+1, [newText]);
    }
    emit(TranslateState(texts));
  }
}
