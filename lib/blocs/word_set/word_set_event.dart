import 'package:ooolearning_app/models/word_set.dart';

abstract class WordSetEvent {}

class GetWordSetEvent extends WordSetEvent {}

class SetWordSetEvent extends WordSetEvent {
  SetWordSetEvent({
    required this.wordSet,
  });

  final WordSet wordSet;
}
