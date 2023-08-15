import 'package:dyn_mouse_scroll/dyn_mouse_scroll.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ooolearning_app/blocs/translation/translation_bloc.dart';
import 'package:ooolearning_app/blocs/translation/translation_event.dart';
import 'package:ooolearning_app/blocs/translation/translation_state.dart';
import 'package:ooolearning_app/models/word.dart';
import 'package:ooolearning_app/models/word_set.dart';
import 'package:ooolearning_app/repositories/translation_repository.dart';
import 'package:ooolearning_app/widgets/base_page.dart';
import 'package:ooolearning_app/widgets/layout_wrapper.dart';

class JapaneseWordsPage extends StatelessWidget {
  const JapaneseWordsPage({super.key});

  static const route = '/japanese-words';

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
                        'Japanese Words',
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
                            Text('Learn Japanese Words!'),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        'Words list',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    const AAA(),
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

enum WordSortField {
  source,
  translation,
}

enum SortMode {
  asc,
  desc,
}

enum AddToWordSetMode {
  add,
  replace,
}

// TODO: fix, rename
class AAA extends StatefulWidget {
  const AAA({super.key});

  @override
  State<AAA> createState() => _AAAState();
}

class _AAAState extends State<AAA> {
  late final _translationBloc = TranslationBloc(
    translationRepository:
        RepositoryProvider.of<TranslationRepository>(context),
  );

  final _formKey = GlobalKey<FormState>();

  final _sourceFocusNode = FocusNode();
  final _sourceController = TextEditingController();

  final _translationFocusNode = FocusNode();
  final _translationController = TextEditingController();

  WordSet? _wordSet;
  var _wordSortField = WordSortField.source;
  var _sortMode = SortMode.asc;
  var _doTranslateWords = true;

  void _addToWordSet({
    required WordSet? wordSet,
    required AddToWordSetMode addToWordSetMode,
  }) {
    switch (addToWordSetMode) {
      case AddToWordSetMode.add:
        if (_wordSet == null) {
          setState(() {
            _wordSet =
                WordSet(identifier: 'main', words: {...wordSet?.words ?? []});
          });
        } else {
          setState(() {
            _wordSet?.words.addAll(wordSet?.words ?? []);
          });
        }
      case AddToWordSetMode.replace:
        if (wordSet == null) {
          setState(() {
            _wordSet = null;
          });
        } else {
          setState(() {
            _wordSet = WordSet(identifier: 'main', words: {...wordSet.words});
          });
        }
    }
  }

  Widget _getAddWordCard() {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: FocusTraversalGroup(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text('Add new Word'),
                const SizedBox(height: 16),
                TextFormField(
                  focusNode: _sourceFocusNode,
                  controller: _sourceController,
                  decoration: InputDecoration(
                    labelText: 'Source Word',
                    filled: true,
                    fillColor: Theme.of(context).hoverColor,
                  ),
                  onFieldSubmitted: (value) {
                    _translationFocusNode.requestFocus();
                  },
                  validator: (value) {
                    value ??= '';

                    if (value.trim().isEmpty) {
                      return 'Invalid value.';
                    }

                    return null;
                  },
                  onEditingComplete: () {
                    _translateText();
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  focusNode: _translationFocusNode,
                  controller: _translationController,
                  decoration: InputDecoration(
                    labelText: 'Translation',
                    filled: true,
                    fillColor: Theme.of(context).hoverColor,
                  ),
                  onFieldSubmitted: (value) {
                    _validate();
                  },
                  validator: (value) {
                    value ??= '';

                    if (value.trim().isEmpty) {
                      return 'Invalid value.';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 16),
                OutlinedButton(
                  onPressed: () {
                    _validate();
                  },
                  child: const Text('Add new Word'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getLoadSetsCard() {
    return Card(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text('Load existing Sets'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: Text(
              'Default Sets',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          Tooltip(
            message: 'Add Word Set to currently selected Set',
            child: ListTile(
              title: const Text('Adjectives'),
              onTap: () {
                _addToWordSet(
                  wordSet: WordSet.adjectives.clone(),
                  addToWordSetMode: AddToWordSetMode.add,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: Text(
              'User Sets',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          Tooltip(
            message: 'Replace currently selected Set',
            child: ListTile(
              title: const Text('Main Set'),
              onTap: () {
                setState(() {
                  // TODO: fix, load main set
                  // _words.clear();
                  // _words.addAll([
                  //   const Word(source: 'cold', translation: 'samui'),
                  //   const Word(source: 'red', translation: 'akai'),
                  //   const Word(source: 'weak', translation: 'yowai'),
                  //   const Word(source: 'fast', translation: 'hayai'),
                  // ]);
                });
              },
            ),
          ),
          const Divider(height: 0),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: OutlinedButton(
              onPressed: () {
                // TODO: fix, import
              },
              child: const Text('Import Set'),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: OutlinedButton(
              onPressed: () {
                // TODO: fix, export
              },
              child: const Text('Export Set'),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _getSettingsCard() {
    return Card(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CheckboxListTile(
            value: _doTranslateWords,
            title: const Text('Automatically translate added Words'),
            onChanged: (value) {
              if (value == null) {
                return;
              }

              setState(() {
                _doTranslateWords = value;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _getWordsListCard() {
    final sortedWords = [..._wordSet?.words.toList() ?? []];

    sortedWords.sort(
      (a, b) {
        final multiplier = _sortMode == SortMode.asc ? 1 : -1;

        switch (_wordSortField) {
          case WordSortField.source:
            return a.source.compareTo(b.source) * multiplier;
          case WordSortField.translation:
            return a.translation.compareTo(b.translation) * multiplier;
        }
      },
    );

    final wordSetName = {
          'adjectives': 'Adjectives',
          'main': 'Main Set',
        }[_wordSet?.identifier] ??
        'None';

    return Card(
      margin: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(text: 'Current Set: '),
                            TextSpan(
                              text: wordSetName,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.redAccent,
                      ),
                      onPressed: () {
                        _addToWordSet(
                          wordSet: null,
                          addToWordSetMode: AddToWordSetMode.replace,
                        );
                      },
                      child: const Text('Empty Set'),
                    ),
                    const SizedBox(width: 16),
                    TextButton(
                      onPressed: () {
                        // TODO: fix, save set
                      },
                      child: const Text('Save Set'),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: _getWordsListHeader(
                        title: 'Word',
                        wordSortField: WordSortField.source,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _getWordsListHeader(
                        title: 'Translation',
                        wordSortField: WordSortField.translation,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Visibility(
                      visible: false,
                      maintainSize: true,
                      maintainState: true,
                      maintainAnimation: true,
                      child: IconButton(
                        splashRadius: 24,
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                        icon: Icon(Icons.close),
                        onPressed: null,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(height: 0),
          if (sortedWords.isEmpty)
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text('No Words added yet.'),
            )
          else
            SizedBox(
              height: 400,
              child: ListView.separated(
                itemCount: sortedWords.length,
                separatorBuilder: (context, index) {
                  return const Divider(height: 0);
                },
                itemBuilder: (context, index) {
                  final word = sortedWords[index];

                  return Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(child: Text(word.source)),
                        const SizedBox(width: 8),
                        Expanded(child: Text(word.translation)),
                        const SizedBox(width: 8),
                        IconButton(
                          tooltip: 'Delete',
                          splashRadius: 24,
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            setState(() {
                              _wordSet?.words.remove(word);
                            });
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }

  Widget _getWordsListHeader({
    required String title,
    required WordSortField wordSortField,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          splashRadius: 24,
          tooltip:
              _sortMode == SortMode.asc ? 'Sort Ascending' : 'Sort Descending',
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          icon: Icon(
            _sortMode == SortMode.asc
                ? Icons.arrow_circle_up_rounded
                : Icons.arrow_circle_down_rounded,
            color: _wordSortField == wordSortField
                ? Theme.of(context).colorScheme.secondary
                : null,
          ),
          onPressed: () {
            if (_wordSortField == wordSortField) {
              setState(() {
                _sortMode =
                    _sortMode == SortMode.asc ? SortMode.desc : SortMode.asc;
              });
            } else {
              setState(() {
                _wordSortField = wordSortField;
              });
            }
          },
        ),
        const SizedBox(width: 8),
        Expanded(child: Text(title)),
      ],
    );
  }

  void _translateText() {
    final source = _sourceController.text.trim();

    if (source.isEmpty || !_doTranslateWords) {
      return;
    }

    _translationBloc.add(TranslateTextEvent(text: source));
  }

  void _validate() {
    if (_formKey.currentState?.validate() != true) {
      return;
    }

    final source = _sourceController.text.trim();
    final translation = _translationController.text.trim();

    _addToWordSet(
      wordSet: WordSet(
        identifier: 'main',
        words: {
          Word(source: source, translation: translation),
        },
      ),
      addToWordSetMode: AddToWordSetMode.add,
    );

    _sourceController.clear();
    _translationController.clear();
  }

  @override
  void initState() {
    super.initState();

    _sourceFocusNode.addListener(() {
      if (!_sourceFocusNode.hasFocus) {
        _translateText();
      }
    });
  }

  @override
  void dispose() {
    _sourceFocusNode.removeListener(() {});

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TranslationBloc, TranslationState>(
      bloc: _translationBloc,
      listener: (context, state) {
        if (state is TranslateTextDoneState) {
          _translationController.text = state.text;

          if (_translationFocusNode.hasFocus) {
            _translationController.selection =
                TextSelection(baseOffset: 0, extentOffset: state.text.length);
          }
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          LayoutWrapper(
            desktop: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _getAddWordCard(),
                          const SizedBox(height: 16),
                          Expanded(child: _getLoadSetsCard()),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 3,
                      child: _getWordsListCard(),
                    ),
                  ],
                ),
              ),
            ),
            // TODO: fix, mobile view
            mobile: Container(),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Options',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _getSettingsCard(),
          ),
        ],
      ),
    );
  }
}
