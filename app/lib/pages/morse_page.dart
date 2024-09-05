import 'package:dyn_mouse_scroll/dyn_mouse_scroll.dart';
import 'package:flutter/material.dart';
import 'package:ooolearning_app/models/flash_card_option.dart';
import 'package:ooolearning_app/models/flash_card_option_set.dart';
import 'package:ooolearning_app/modules/flash_cards_module.dart';
import 'package:ooolearning_app/widgets/base_page.dart';

class MorsePage extends StatelessWidget {
  const MorsePage({super.key});

  static const route = '/morse';

  final _flashCardOptionSets = const <FlashCardOptionSet>[
    FlashCardOptionSet(
      label: 'Morse',
      flashCardOptions: [
        FlashCardOption(
          label: '.-',
          answers: ['a'],
        ),
        FlashCardOption(
          label: '-...',
          answers: ['b'],
        ),
        FlashCardOption(
          label: '-.-.',
          answers: ['c'],
        ),
        FlashCardOption(
          label: '-..',
          answers: ['d'],
        ),
        FlashCardOption(
          label: '.',
          answers: ['e'],
        ),
        FlashCardOption(
          label: '..-.',
          answers: ['f'],
        ),
        FlashCardOption(
          label: '--.',
          answers: ['g'],
        ),
        FlashCardOption(
          label: '....',
          answers: ['h'],
        ),
        FlashCardOption(
          label: '..',
          answers: ['i'],
        ),
        FlashCardOption(
          label: '.---',
          answers: ['j'],
        ),
        FlashCardOption(
          label: '-.-',
          answers: ['k'],
        ),
        FlashCardOption(
          label: '.-..',
          answers: ['l'],
        ),
        FlashCardOption(
          label: '--',
          answers: ['m'],
        ),
        FlashCardOption(
          label: '-.',
          answers: ['n'],
        ),
        FlashCardOption(
          label: '---',
          answers: ['o'],
        ),
        FlashCardOption(
          label: '.--.',
          answers: ['p'],
        ),
        FlashCardOption(
          label: '--.-',
          answers: ['q'],
        ),
        FlashCardOption(
          label: '.-.',
          answers: ['r'],
        ),
        FlashCardOption(
          label: '...',
          answers: ['s'],
        ),
        FlashCardOption(
          label: '-',
          answers: ['t'],
        ),
        FlashCardOption(
          label: '..-',
          answers: ['u'],
        ),
        FlashCardOption(
          label: '...-',
          answers: ['v'],
        ),
        FlashCardOption(
          label: '.--',
          answers: ['w'],
        ),
        FlashCardOption(
          label: '-..-',
          answers: ['x'],
        ),
        FlashCardOption(
          label: '-.--',
          answers: ['y'],
        ),
        FlashCardOption(
          label: '--..',
          answers: ['z'],
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
                        'Morse',
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
                            Text('Learn Morse Code!'),
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
