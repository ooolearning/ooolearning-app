import 'package:ooolearning_app/models/flash_card_option.dart';

class FlashCardOptionSet {
  const FlashCardOptionSet({
    required this.label,
    required this.flashCardOptions,
  });

  final String label;
  final List<FlashCardOption> flashCardOptions;
}
