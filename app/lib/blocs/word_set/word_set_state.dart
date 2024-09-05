import 'package:ooolearning_app/models/word_set.dart';

abstract class WordSetState {}

class InitialWordSetState extends WordSetState {}

class WordSetLoadingState extends WordSetState {}

// GetWordSet

class GetWordSetDoneState extends WordSetState {
  GetWordSetDoneState({
    required this.wordSet,
  });

  final WordSet wordSet;
}

class GetWordSetErrorState extends WordSetState {
  GetWordSetErrorState({
    required this.message,
  });

  final String message;
}

// SetWordSet

class SetWordSetDoneState extends WordSetState {}

class SetWordSetErrorState extends WordSetState {
  SetWordSetErrorState({
    required this.message,
  });

  final String message;
}
