import 'package:json_annotation/json_annotation.dart';
import 'package:ooolearning_app/models/word.dart';

part 'word_set.g.dart';

@JsonSerializable(fieldRename: FieldRename.none, explicitToJson: true)
class WordSet {
  const WordSet({
    required this.identifier,
    required this.words,
  });

  final String identifier;
  final Set<Word> words;

  static const adjectives = WordSet(
    identifier: 'adjectives',
    words: {
      Word(source: 'cold', translation: 'samui'),
      Word(source: 'fast', translation: 'hayai'),
      Word(source: 'red', translation: 'akai'),
      Word(source: 'weak', translation: 'yowai'),
    },
  );

  WordSet clone() {
    return WordSet(
      identifier: identifier,
      words: {...words},
    );
  }

  factory WordSet.fromJson(Map<String, dynamic> json) =>
      _$WordSetFromJson(json);

  Map<String, dynamic> toJson() => _$WordSetToJson(this);
}
