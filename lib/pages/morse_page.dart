import 'package:dyn_mouse_scroll/dyn_mouse_scroll.dart';
import 'package:flutter/material.dart';
import 'package:ooolearning_app/models/flash_card_option.dart';
import 'package:ooolearning_app/modules/flash_cards_module.dart';
import 'package:ooolearning_app/utils/constants.dart';
import 'package:ooolearning_app/widgets/base_page.dart';

class MorsePage extends StatelessWidget {
  const MorsePage({super.key});

  static const route = '/morse';

  final _flashCardOptions = const <FlashCardOption>[
    FlashCardOption(answer: 'a', label: '.-'),
    FlashCardOption(answer: 'b', label: '-...'),
    FlashCardOption(answer: 'c', label: '-.-.'),
    FlashCardOption(answer: 'd', label: '-..'),
    FlashCardOption(answer: 'e', label: '.'),
    FlashCardOption(answer: 'f', label: '..-.'),
    FlashCardOption(answer: 'g', label: '--.'),
    FlashCardOption(answer: 'h', label: '....'),
    FlashCardOption(answer: 'i', label: '..'),
    FlashCardOption(answer: 'j', label: '.---'),
    FlashCardOption(answer: 'k', label: '-.-'),
    FlashCardOption(answer: 'l', label: '.-..'),
    FlashCardOption(answer: 'm', label: '--'),
    FlashCardOption(answer: 'n', label: '-.'),
    FlashCardOption(answer: 'o', label: '---'),
    FlashCardOption(answer: 'p', label: '.--.'),
    FlashCardOption(answer: 'q', label: '--.-'),
    FlashCardOption(answer: 'r', label: '.-.'),
    FlashCardOption(answer: 's', label: '...'),
    FlashCardOption(answer: 't', label: '-'),
    FlashCardOption(answer: 'u', label: '..-'),
    FlashCardOption(answer: 'v', label: '...-'),
    FlashCardOption(answer: 'w', label: '.--'),
    FlashCardOption(answer: 'x', label: '-..-'),
    FlashCardOption(answer: 'y', label: '-.--'),
    FlashCardOption(answer: 'z', label: '--..'),
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
                    Card(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: const [
                            Text('Welcome to ${Constants.appName}!'),
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
