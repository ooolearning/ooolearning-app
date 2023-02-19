import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ooolearning_app/models/flash_card_option.dart';

class FlashCardsModule extends StatefulWidget {
  const FlashCardsModule({
    super.key,
    required this.flashCardOptions,
  });

  final List<FlashCardOption> flashCardOptions;

  @override
  State<FlashCardsModule> createState() => _FlashCardsModuleState();
}

class _FlashCardsModuleState extends State<FlashCardsModule> {
  FlashCardOption? _current;

  void _shuffleFlashCard() {
    final rand = Random().nextInt(widget.flashCardOptions.length);

    setState(() {
      _current = widget.flashCardOptions.elementAt(rand);
    });
  }

  @override
  void initState() {
    super.initState();

    _shuffleFlashCard();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: AspectRatio(
                aspectRatio: 1,
                child: Card(
                  margin: EdgeInsets.zero,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Center(
                      child: Text(
                        _current?.label ?? '',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            const Expanded(
              flex: 2,
              child: Placeholder(),
            ),
          ],
        ),
      ),
    );
  }
}
