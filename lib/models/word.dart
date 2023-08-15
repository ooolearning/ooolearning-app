import 'package:json_annotation/json_annotation.dart';

part 'word.g.dart';

@JsonSerializable(fieldRename: FieldRename.none, explicitToJson: true)
class Word {
  const Word({
    required this.source,
    required this.translation,
  });

  final String source;
  final String translation;

  factory Word.fromJson(Map<String, dynamic> json) => _$WordFromJson(json);

  Map<String, dynamic> toJson() => _$WordToJson(this);
}
