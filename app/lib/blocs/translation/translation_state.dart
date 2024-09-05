abstract class TranslationState {}

class InitialTranslationState extends TranslationState {}

class TranslationLoadingState extends TranslationState {}

// TranslateText

class TranslateTextDoneState extends TranslationState {
  TranslateTextDoneState({
    required this.text,
  });

  final String text;
}

class TranslateTextErrorState extends TranslationState {
  TranslateTextErrorState({
    required this.message,
  });

  final String message;
}
