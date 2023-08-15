import 'dart:convert';

import 'package:ooolearning_app/models/word_set.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WordSetRepository {
  final _key = 'word_set';

  Future<WordSet> getWordSet() async {
    final prefs = await SharedPreferences.getInstance();

    final wordSet = prefs.getString(_key);

    if (wordSet == null) {
      return const WordSet(identifier: 'main', words: {});
    }

    return WordSet.fromJson(jsonDecode(wordSet));
  }

  Future<void> setWordSet(WordSet? wordSet) async {
    final prefs = await SharedPreferences.getInstance();

    if (wordSet == null) {
      await prefs.remove(_key);
    } else {
      await prefs.setString(_key, jsonEncode(wordSet.toJson()));
    }
  }
}
