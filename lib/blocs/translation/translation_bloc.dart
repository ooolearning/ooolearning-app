import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ooolearning_app/blocs/translation/translation_event.dart';
import 'package:ooolearning_app/blocs/translation/translation_state.dart';
import 'package:ooolearning_app/repositories/translation_repository.dart';

class TranslationBloc extends Bloc<TranslationEvent, TranslationState> {
  TranslationBloc({required this.translationRepository})
      : super(InitialTranslationState()) {
    on<TranslateTextEvent>((event, emit) async {
      try {
        final res = await translationRepository.translate(text: event.text);

        emit(TranslateTextDoneState(text: res[0]));
      } catch (e) {
        emit(TranslateTextErrorState(message: e.toString()));
      }
    });
  }

  final TranslationRepository translationRepository;
}
