// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Word _$WordFromJson(Map<String, dynamic> json) => Word(
      source: json['source'] as String,
      translation: json['translation'] as String,
    );

Map<String, dynamic> _$WordToJson(Word instance) => <String, dynamic>{
      'source': instance.source,
      'translation': instance.translation,
    };
