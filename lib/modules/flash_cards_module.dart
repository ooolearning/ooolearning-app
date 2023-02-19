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

  final _focusNode = FocusNode();
  final _controller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void _shuffleFlashCard() {
    final rand = Random().nextInt(widget.flashCardOptions.length);

    setState(() {
      _current = widget.flashCardOptions.elementAt(rand);
    });
  }

  void _validate() {
    if (_formKey.currentState?.validate() == true) {
      _shuffleFlashCard();
    }

    _controller.clear();
    _focusNode.requestFocus();
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
                              tooltip: 'Shuffle',
                              icon: const Icon(Icons.refresh),
                              onPressed: _shuffleFlashCard,
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Expanded(
                          child: Center(
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 200),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
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
    );
  }
}
