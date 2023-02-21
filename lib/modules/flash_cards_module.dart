import 'dart:collection';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:ooolearning_app/models/flash_card_option.dart';
import 'package:ooolearning_app/models/flash_cards_stats.dart';
import 'package:ooolearning_app/utils/assets.dart';

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

  final _random = Random();

  final _queue = ListQueue<FlashCardOption>();

  final _stats = FlashCardsStats(
    totalAnswers: 0,
    correctAnswers: 0,
    wrongAnswers: 0,
    cardsSkipped: 0,
  );

  final _correctAudioPlayer = AudioPlayer();
  final _wrongAudioPlayer = AudioPlayer();

  final _focusNode = FocusNode();
  final _controller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void _nextFlashCard() {
    final newFlashCard = _queue.removeFirst();

    _queue.addLast(_pickRandomFlashCard());

    setState(() {
      _current = newFlashCard;
    });
  }

  FlashCardOption _pickRandomFlashCard() {
    return widget.flashCardOptions
        .elementAt(_random.nextInt(widget.flashCardOptions.length));
  }

  void _validate() {
    if (_controller.text.isEmpty) {
      _controller.clear();
      _focusNode.requestFocus();

      return;
    }

    if (_formKey.currentState?.validate() == true) {
      _nextFlashCard();

      _correctAudioPlayer.seek(Duration.zero);
      _correctAudioPlayer.resume();

      setState(() {
        _stats.totalAnswers++;
        _stats.correctAnswers++;
      });
    } else {
      _wrongAudioPlayer.seek(Duration.zero);
      _wrongAudioPlayer.resume();

      setState(() {
        _stats.totalAnswers++;
        _stats.wrongAnswers++;
      });
    }

    _controller.clear();
    _focusNode.requestFocus();
  }

  @override
  void initState() {
    super.initState();

    _queue.addAll([
      _pickRandomFlashCard(),
      _pickRandomFlashCard(),
      _pickRandomFlashCard(),
      _pickRandomFlashCard(),
      _pickRandomFlashCard(),
    ]);

    _nextFlashCard();

    Future(() async {
      await Future.wait(
        [
          _correctAudioPlayer.audioCache.clearAll(),
          _wrongAudioPlayer.audioCache.clearAll(),
        ],
      );

      await Future.wait(
        [
          _correctAudioPlayer.setSource(AssetSource(AudioAssets.correct)),
          _wrongAudioPlayer.setSource(AssetSource(AudioAssets.wrong)),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final totalAnswers = _stats.totalAnswers == 0 ? 1 : _stats.totalAnswers;

    final correctAnswersPercentage =
        (_stats.correctAnswers * 100 / totalAnswers)
            .toStringAsFixed(2)
            .replaceAll(RegExp(r'\.'), ',');

    final wrongAnswersPercentage = (_stats.wrongAnswers * 100 / totalAnswers)
        .toStringAsFixed(2)
        .replaceAll(RegExp(r'\.'), ',');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: Center(
                                child: Text(
                                  _current?.label ?? '',
                                  style:
                                      Theme.of(context).textTheme.headlineLarge,
                                ),
                              ),
                            ),
                            Text(
                              'Next up',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: _queue
                                  .toList()
                                  .asMap()
                                  .map((key, value) {
                                    final text = Text(
                                      value.label,
                                      textAlign: TextAlign.center,
                                      style: key == 0
                                          ? const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            )
                                          : null,
                                    );

                                    final newValue = Expanded(
                                      child: key == 0
                                          ? CircleAvatar(child: text)
                                          : text,
                                    );

                                    return MapEntry(key, newValue);
                                  })
                                  .values
                                  .toList(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  flex: 2,
                  child: Form(
                    key: _formKey,
                    child: Card(
                      margin: EdgeInsets.zero,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                  tooltip: 'Skip',
                                  icon: const Icon(Icons.skip_next),
                                  onPressed: () {
                                    _nextFlashCard();

                                    setState(() {
                                      _stats.cardsSkipped++;
                                    });
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Expanded(
                              child: Center(
                                child: ConstrainedBox(
                                  constraints: const BoxConstraints(
                                    maxWidth: 200,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          focusNode: _focusNode,
                                          controller: _controller,
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.grey.shade100,
                                          ),
                                          onFieldSubmitted: (value) {
                                            _validate();
                                          },
                                          validator: (value) {
                                            value ??= '';

                                            if (value.toLowerCase() !=
                                                _current?.answer) {
                                              return 'Try again!';
                                            }

                                            return null;
                                          },
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      IconButton(
                                        tooltip: 'Submit',
                                        icon: const Icon(Icons.send),
                                        onPressed: _validate,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'Stats',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 1,
                  child: Card(
                    margin: EdgeInsets.zero,
                    child: Column(
                      children: [
                        ListTile(
                          title: const Text('Total answers'),
                          trailing: Text(
                            _stats.totalAnswers.toStringAsFixed(0),
                          ),
                        ),
                        ListTile(
                          title: const Text('Correct answers'),
                          subtitle: Text('($correctAnswersPercentage%)'),
                          trailing: Text(
                            _stats.correctAnswers.toStringAsFixed(0),
                          ),
                        ),
                        ListTile(
                          title: const Text('Wrong answers'),
                          subtitle: Text('($wrongAnswersPercentage%)'),
                          trailing: Text(
                            _stats.wrongAnswers.toStringAsFixed(0),
                          ),
                        ),
                        const Divider(height: 0),
                        ListTile(
                          title: const Text('Cards skipped'),
                          trailing: Text(
                            _stats.cardsSkipped.toStringAsFixed(0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  flex: 2,
                  child: Card(
                    margin: EdgeInsets.zero,
                    child: Container(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
