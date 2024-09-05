import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ooolearning_app/blocs/word_set/word_set_event.dart';
import 'package:ooolearning_app/blocs/word_set/word_set_state.dart';
import 'package:ooolearning_app/repositories/word_set_repository.dart';

class WordSetBloc extends Bloc<WordSetEvent, WordSetState> {
  WordSetBloc({required this.wordSetRepository})
      : super(InitialWordSetState()) {
    on<GetWordSetEvent>((event, emit) async {
      try {
        final res = await wordSetRepository.getWordSet();

        emit(GetWordSetDoneState(wordSet: res));
      } catch (e) {
        emit(GetWordSetErrorState(message: e.toString()));
      }
    });

    on<SetWordSetEvent>((event, emit) async {
      try {
        await wordSetRepository.setWordSet(event.wordSet);

        emit(SetWordSetDoneState());
      } catch (e) {
        emit(SetWordSetErrorState(message: e.toString()));
      }
    });
  }

  final WordSetRepository wordSetRepository;
}
