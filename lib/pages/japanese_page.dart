import 'package:dyn_mouse_scroll/dyn_mouse_scroll.dart';
import 'package:flutter/material.dart';
import 'package:ooolearning_app/models/flash_card_option.dart';
import 'package:ooolearning_app/models/flash_card_option_set.dart';
import 'package:ooolearning_app/modules/flash_cards_module.dart';
import 'package:ooolearning_app/widgets/base_page.dart';

class JapanesePage extends StatelessWidget {
  const JapanesePage({super.key});

  static const route = '/japanese';

  final _flashCardOptionSets = const <FlashCardOptionSet>[
    FlashCardOptionSet(
      label: 'Hiragana',
      flashCardOptions: [
        FlashCardOption(
          label: 'ん',
          answers: ['n'],
        ),
        FlashCardOption(
          label: 'わ',
          answers: ['wa'],
        ),
        FlashCardOption(
          label: 'を',
          answers: ['wo'],
        ),
        FlashCardOption(
          label: 'ら',
          answers: ['ra'],
        ),
        FlashCardOption(
          label: 'り',
          answers: ['ri'],
        ),
        FlashCardOption(
          label: 'る',
          answers: ['ru'],
        ),
        FlashCardOption(
          label: 'れ',
          answers: ['re'],
        ),
        FlashCardOption(
          label: 'ろ',
          answers: ['ro'],
        ),
        FlashCardOption(
          label: 'や',
          answers: ['ya'],
        ),
        FlashCardOption(
          label: 'ゆ',
          answers: ['yu'],
        ),
        FlashCardOption(
          label: 'よ',
          answers: ['yo'],
        ),
        FlashCardOption(
          label: 'ま',
          answers: ['ma'],
        ),
        FlashCardOption(
          label: 'み',
          answers: ['mi'],
        ),
        FlashCardOption(
          label: 'む',
          answers: ['mu'],
        ),
        FlashCardOption(
          label: 'め',
          answers: ['me'],
        ),
        FlashCardOption(
          label: 'も',
          answers: ['mo'],
        ),
        FlashCardOption(
          label: 'は',
          answers: ['ha'],
        ),
        FlashCardOption(
          label: 'ひ',
          answers: ['hi'],
        ),
        FlashCardOption(
          label: 'ふ',
          answers: ['fu'],
        ),
        FlashCardOption(
          label: 'へ',
          answers: ['he'],
        ),
        FlashCardOption(
          label: 'ほ',
          answers: ['ho'],
        ),
        FlashCardOption(
          label: 'な',
          answers: ['na'],
        ),
        FlashCardOption(
          label: 'に',
          answers: ['ni'],
        ),
        FlashCardOption(
          label: 'ぬ',
          answers: ['nu'],
        ),
        FlashCardOption(
          label: 'ね',
          answers: ['ne'],
        ),
        FlashCardOption(
          label: 'の',
          answers: ['no'],
        ),
        FlashCardOption(
          label: 'た',
          answers: ['ta'],
        ),
        FlashCardOption(
          label: 'ち',
          answers: ['chi'],
        ),
        FlashCardOption(
          label: 'つ',
          answers: ['tsu'],
        ),
        FlashCardOption(
          label: 'て',
          answers: ['te'],
        ),
        FlashCardOption(
          label: 'と',
          answers: ['to'],
        ),
        FlashCardOption(
          label: 'さ',
          answers: ['sa'],
        ),
        FlashCardOption(
          label: 'し',
          answers: ['shi'],
        ),
        FlashCardOption(
          label: 'す',
          answers: ['su'],
        ),
        FlashCardOption(
          label: 'せ',
          answers: ['se'],
        ),
        FlashCardOption(
          label: 'そ',
          answers: ['so'],
        ),
        FlashCardOption(
          label: 'か',
          answers: ['ka'],
        ),
        FlashCardOption(
          label: 'き',
          answers: ['ki'],
        ),
        FlashCardOption(
          label: 'く',
          answers: ['ku'],
        ),
        FlashCardOption(
          label: 'け',
          answers: ['ke'],
        ),
        FlashCardOption(
          label: 'こ',
          answers: ['ko'],
        ),
        FlashCardOption(
          label: 'あ',
          answers: ['a'],
        ),
        FlashCardOption(
          label: 'い',
          answers: ['i'],
        ),
        FlashCardOption(
          label: 'う',
          answers: ['u'],
        ),
        FlashCardOption(
          label: 'え',
          answers: ['e'],
        ),
        FlashCardOption(
          label: 'お',
          answers: ['o'],
        ),
      ],
    ),
    FlashCardOptionSet(
      label: 'Katakana',
      flashCardOptions: [
        FlashCardOption(
          label: 'ン',
          answers: ['n'],
        ),
        FlashCardOption(
          label: 'ワ',
          answers: ['wa'],
        ),
        FlashCardOption(
          label: 'ヲ',
          answers: ['wo'],
        ),
        FlashCardOption(
          label: 'ラ',
          answers: ['ra'],
        ),
        FlashCardOption(
          label: 'リ',
          answers: ['ri'],
        ),
        FlashCardOption(
          label: 'ル',
          answers: ['ru'],
        ),
        FlashCardOption(
          label: 'レ',
          answers: ['re'],
        ),
        FlashCardOption(
          label: 'ロ',
          answers: ['ro'],
        ),
        FlashCardOption(
          label: 'ヤ',
          answers: ['ya'],
        ),
        FlashCardOption(
          label: 'ユ',
          answers: ['yu'],
        ),
        FlashCardOption(
          label: 'ヨ',
          answers: ['yo'],
        ),
        FlashCardOption(
          label: 'マ',
          answers: ['ma'],
        ),
        FlashCardOption(
          label: 'ミ',
          answers: ['mi'],
        ),
        FlashCardOption(
          label: 'ム',
          answers: ['mu'],
        ),
        FlashCardOption(
          label: 'メ',
          answers: ['me'],
        ),
        FlashCardOption(
          label: 'モ',
          answers: ['mo'],
        ),
        FlashCardOption(
          label: 'ハ',
          answers: ['ha'],
        ),
        FlashCardOption(
          label: 'ヒ',
          answers: ['hi'],
        ),
        FlashCardOption(
          label: 'フ',
          answers: ['fu'],
        ),
        FlashCardOption(
          label: 'ヘ',
          answers: ['he'],
        ),
        FlashCardOption(
          label: 'ホ',
          answers: ['ho'],
        ),
        FlashCardOption(
          label: 'ナ',
          answers: ['na'],
        ),
        FlashCardOption(
          label: 'ニ',
          answers: ['ni'],
        ),
        FlashCardOption(
          label: 'ヌ',
          answers: ['nu'],
        ),
        FlashCardOption(
          label: 'ネ',
          answers: ['ne'],
        ),
        FlashCardOption(
          label: 'ノ',
          answers: ['no'],
        ),
        FlashCardOption(
          label: 'タ',
          answers: ['ta'],
        ),
        FlashCardOption(
          label: 'チ',
          answers: ['chi'],
        ),
        FlashCardOption(
          label: 'ツ',
          answers: ['tsu'],
        ),
        FlashCardOption(
          label: 'テ',
          answers: ['te'],
        ),
        FlashCardOption(
          label: 'ト',
          answers: ['to'],
        ),
        FlashCardOption(
          label: 'サ',
          answers: ['sa'],
        ),
        FlashCardOption(
          label: 'シ',
          answers: ['shi'],
        ),
        FlashCardOption(
          label: 'ス',
          answers: ['su'],
        ),
        FlashCardOption(
          label: 'セ',
          answers: ['se'],
        ),
        FlashCardOption(
          label: 'ソ',
          answers: ['so'],
        ),
        FlashCardOption(
          label: 'カ',
          answers: ['ka'],
        ),
        FlashCardOption(
          label: 'キ',
          answers: ['ki'],
        ),
        FlashCardOption(
          label: 'ク',
          answers: ['ku'],
        ),
        FlashCardOption(
          label: 'ケ',
          answers: ['ke'],
        ),
        FlashCardOption(
          label: 'コ',
          answers: ['ko'],
        ),
        FlashCardOption(
          label: 'ア',
          answers: ['a'],
        ),
        FlashCardOption(
          label: 'イ',
          answers: ['i'],
        ),
        FlashCardOption(
          label: 'ウ',
          answers: ['u'],
        ),
        FlashCardOption(
          label: 'エ',
          answers: ['e'],
        ),
        FlashCardOption(
          label: 'オ',
          answers: ['o'],
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
                        'Japanese',
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
                            Text('Learn japanese!'),
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
