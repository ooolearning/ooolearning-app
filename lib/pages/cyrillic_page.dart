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
      label: 'Cyrillic',
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
          answers: ['e'],
        ),
        FlashCardOption(
          label: 'ё',
          answers: ['e'],
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
          answers: ['i'],
        ),
        FlashCardOption(
          label: 'i',
          answers: ['i'],
        ),
        FlashCardOption(
          label: 'й',
          answers: ['i'],
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
          label: 'ѣ',
          answers: ['ie'],
        ),
        FlashCardOption(
          label: 'э',
          answers: ['e'],
        ),
        FlashCardOption(
          label: 'ю',
          answers: ['iu', 'yu'],
        ),
        FlashCardOption(
          label: 'я',
          answers: ['ia', 'ya'],
        ),
        FlashCardOption(
          label: 'ѳ',
          answers: ['f'],
        ),
        FlashCardOption(
          label: 'v',
          answers: ['y'],
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
