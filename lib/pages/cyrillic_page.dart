import 'package:dyn_mouse_scroll/dyn_mouse_scroll.dart';
import 'package:flutter/material.dart';
import 'package:ooolearning_app/models/flash_card_option.dart';
import 'package:ooolearning_app/modules/flash_cards_module.dart';
import 'package:ooolearning_app/widgets/base_page.dart';

class CyrillicPage extends StatelessWidget {
  const CyrillicPage({super.key});

  static const route = '/cyrillic';

  final _flashCardOptions = const <FlashCardOption>[
    FlashCardOption(answer: 'a', label: 'а'),
    FlashCardOption(answer: 'b', label: 'б'),
    FlashCardOption(answer: 'v', label: 'в'),
    FlashCardOption(answer: 'g', label: 'г'),
    FlashCardOption(answer: 'd', label: 'д'),
    FlashCardOption(answer: 'e', label: 'е'),
    FlashCardOption(answer: 'e', label: 'ё'),
    FlashCardOption(answer: 'zh', label: 'ж'),
    FlashCardOption(answer: 'z', label: 'з'),
    FlashCardOption(answer: 'i', label: 'и'),
    FlashCardOption(answer: 'i', label: 'i'),
    FlashCardOption(answer: 'i', label: 'й'),
    FlashCardOption(answer: 'k', label: 'к'),
    FlashCardOption(answer: 'l', label: 'л'),
    FlashCardOption(answer: 'm', label: 'м'),
    FlashCardOption(answer: 'n', label: 'н'),
    FlashCardOption(answer: 'o', label: 'о'),
    FlashCardOption(answer: 'p', label: 'п'),
    FlashCardOption(answer: 'r', label: 'р'),
    FlashCardOption(answer: 's', label: 'с'),
    FlashCardOption(answer: 't', label: 'т'),
    FlashCardOption(answer: 'u', label: 'у'),
    FlashCardOption(answer: 'f', label: 'ф'),
    FlashCardOption(answer: 'kh', label: 'х'),
    FlashCardOption(answer: 'ts', label: 'ц'),
    FlashCardOption(answer: 'ch', label: 'ч'),
    FlashCardOption(answer: 'sh', label: 'ш'),
    FlashCardOption(answer: 'shch', label: 'щ'),
    FlashCardOption(answer: '"', label: 'ъ'),
    FlashCardOption(answer: 'y', label: 'ы'),
    FlashCardOption(answer: '\'', label: 'ь'),
    FlashCardOption(answer: 'ie', label: 'ѣ'),
    FlashCardOption(answer: 'e', label: 'э'),
    FlashCardOption(answer: 'iu', label: 'ю'),
    FlashCardOption(answer: 'ia', label: 'я'),
    FlashCardOption(answer: 'f', label: 'ѳ'),
    FlashCardOption(answer: 'y', label: 'v'),
  ];

  @override
  Widget build(BuildContext context) {
    return BasePage(
      child: DynMouseScroll(
        builder: (context, controller, physics) {
          return SingleChildScrollView(
            physics: physics,
            controller: controller,
            child: Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        'Cyrillic',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    Card(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: const [
                            Text('Learn cyrillic!'),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        'Quiz',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    FlashCardsModule(flashCardOptions: _flashCardOptions),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
