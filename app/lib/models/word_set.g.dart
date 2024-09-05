// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WordSet _$WordSetFromJson(Map<String, dynamic> json) => WordSet(
      identifier: json['identifier'] as String,
      words: (json['words'] as List<dynamic>)
          .map((e) => Word.fromJson(e as Map<String, dynamic>))
          .toSet(),
    );

Map<String, dynamic> _$WordSetToJson(WordSet instance) => <String, dynamic>{
      'identifier': instance.identifier,
      'words': instance.words.map((e) => e.toJson()).toList(),
    };
