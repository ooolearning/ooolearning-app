import 'package:ooolearning_app/utils/api.dart';

class TranslationRepository {
  TranslationRepository({
    required this.api,
  });

  final Api api;

  Future<List<String>> translate({
    required String text,
  }) async {
    // final res = await api.get(
    //   path: '/translate_a/t',
    //   queryParameters: {
    //     'client': 'dict-chrome-ex',
    //     'sl': 'en',
    //     'tl': 'jp',
    //     'q': text,
    //   },
    // );

    return ['thing', 'maybe', 'perhaps'];
  }
}
