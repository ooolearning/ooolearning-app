import 'package:dyn_mouse_scroll/dyn_mouse_scroll.dart';
import 'package:flutter/material.dart';
import 'package:ooolearning_app/models/flash_card_option.dart';
import 'package:ooolearning_app/models/flash_card_option_set.dart';
import 'package:ooolearning_app/modules/flash_cards_module.dart';
import 'package:ooolearning_app/widgets/base_page.dart';

class CyrillicPage extends StatelessWidget {
  const CyrillicPage({super.key});

  static const route = '/cyrillic';

  final _flashCardOptionSets = const <FlashCardOptionSet>[
    FlashCardOptionSet(
      label: 'Russian',
      flashCardOptions: [
        FlashCardOption(
          label: 'а',
          answers: ['a'],
        ),
        FlashCardOption(
          label: 'б',
          answers: ['b'],
        ),
        FlashCardOption(
          label: 'в',
          answers: ['v'],
        ),
        FlashCardOption(
          label: 'г',
          answers: ['g'],
        ),
        FlashCardOption(
          label: 'д',
          answers: ['d'],
        ),
        FlashCardOption(
          label: 'е',
          answers: ['ye', 'je', 'e'],
        ),
        FlashCardOption(
          label: 'ё',
          answers: ['yo', 'jo', 'ë'],
        ),
        FlashCardOption(
          label: 'ж',
          answers: ['zh', 'ž'],
        ),
        FlashCardOption(
          label: 'з',
          answers: ['z'],
        ),
        FlashCardOption(
          label: 'и',
          answers: ['i'],
        ),
        FlashCardOption(
          label: 'й',
          answers: ['y', 'i', 'j'],
        ),
        FlashCardOption(
          label: 'к',
          answers: ['k'],
        ),
        FlashCardOption(
          label: 'л',
          answers: ['l'],
        ),
        FlashCardOption(
          label: 'м',
          answers: ['m'],
        ),
        FlashCardOption(
          label: 'н',
          answers: ['n'],
        ),
        FlashCardOption(
          label: 'о',
          answers: ['o'],
        ),
        FlashCardOption(
          label: 'п',
          answers: ['p'],
        ),
        FlashCardOption(
          label: 'р',
          answers: ['r'],
        ),
        FlashCardOption(
          label: 'с',
          answers: ['s'],
        ),
        FlashCardOption(
          label: 'т',
          answers: ['t'],
        ),
        FlashCardOption(
          label: 'у',
          answers: ['u'],
        ),
        FlashCardOption(
          label: 'ф',
          answers: ['f'],
        ),
        FlashCardOption(
          label: 'х',
          answers: ['kh', 'h'],
        ),
        FlashCardOption(
          label: 'ц',
          answers: ['ts', 'c'],
        ),
        FlashCardOption(
          label: 'ч',
          answers: ['ch', 'č'],
        ),
        FlashCardOption(
          label: 'ш',
          answers: ['sh', 'š'],
        ),
        FlashCardOption(
          label: 'щ',
          answers: ['shch', 'sch', 'šč'],
        ),
        FlashCardOption(
          label: 'ъ',
          answers: ['"'],
        ),
        FlashCardOption(
          label: 'ы',
          answers: ['y'],
        ),
        FlashCardOption(
          label: 'ь',
          answers: ['\''],
        ),
        FlashCardOption(
          label: 'э',
          answers: ['e', 'è'],
        ),
        FlashCardOption(
          label: 'ю',
          answers: ['yu', 'ju'],
        ),
        FlashCardOption(
          label: 'я',
          answers: ['ya', 'ja'],
        ),
      ],
    ),
    FlashCardOptionSet(
      label: 'Ukrainian',
      flashCardOptions: [
        FlashCardOption(
          label: 'а',
          answers: ['a'],
        ),
        FlashCardOption(
          label: 'б',
          answers: ['b'],
        ),
        FlashCardOption(
          label: 'в',
          answers: ['v'],
        ),
        FlashCardOption(
          label: 'г',
          answers: ['h'],
        ),
        FlashCardOption(
          label: 'ґ',
          answers: ['g'],
        ),
        FlashCardOption(
          label: 'д',
          answers: ['d'],
        ),
        FlashCardOption(
          label: 'е',
          answers: ['e'],
        ),
        FlashCardOption(
          label: 'є',
          answers: ['ye', 'ie'],
        ),
        FlashCardOption(
          label: 'ж',
          answers: ['zh'],
        ),
        FlashCardOption(
          label: 'з',
          answers: ['z'],
        ),
        FlashCardOption(
          label: 'и',
          answers: ['y'],
        ),
        FlashCardOption(
          label: 'i',
          answers: ['i'],
        ),
        FlashCardOption(
          label: 'ї',
          answers: ['yi', 'i'],
        ),
        FlashCardOption(
          label: 'й',
          answers: ['y', 'i'],
        ),
        FlashCardOption(
          label: 'к',
          answers: ['k'],
        ),
        FlashCardOption(
          label: 'л',
          answers: ['l'],
        ),
        FlashCardOption(
          label: 'м',
          answers: ['m'],
        ),
        FlashCardOption(
          label: 'н',
          answers: ['n'],
        ),
        FlashCardOption(
          label: 'о',
          answers: ['o'],
        ),
        FlashCardOption(
          label: 'п',
          answers: ['p'],
        ),
        FlashCardOption(
          label: 'р',
          answers: ['r'],
        ),
        FlashCardOption(
          label: 'с',
          answers: ['s'],
        ),
        FlashCardOption(
          label: 'т',
          answers: ['t'],
        ),
        FlashCardOption(
          label: 'у',
          answers: ['u'],
        ),
        FlashCardOption(
          label: 'ф',
          answers: ['f'],
        ),
        FlashCardOption(
          label: 'х',
          answers: ['kh'],
        ),
        FlashCardOption(
          label: 'ц',
          answers: ['ts'],
        ),
        FlashCardOption(
          label: 'ч',
          answers: ['ch'],
        ),
        FlashCardOption(
          label: 'ш',
          answers: ['sh'],
        ),
        FlashCardOption(
          label: 'щ',
          answers: ['shch'],
        ),
        FlashCardOption(
          label: 'ь',
          answers: ['\''],
        ),
        FlashCardOption(
          label: 'ю',
          answers: ['yu', 'iu'],
        ),
        FlashCardOption(
          label: 'я',
          answers: ['ya', 'ia'],
        ),
        FlashCardOption(
          label: '\'',
          answers: ['"'],
        ),
      ],
    ),
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
                    const Card(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text('Learn Cyrillic!'),
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
                    FlashCardsModule(flashCardOptionSets: _flashCardOptionSets),
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
