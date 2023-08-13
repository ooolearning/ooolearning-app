abstract class TranslationEvent {}

class TranslateTextEvent extends TranslationEvent {
  TranslateTextEvent({
    required this.text,
  });

  final String text;
}
