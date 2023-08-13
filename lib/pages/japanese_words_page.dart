import 'package:dyn_mouse_scroll/dyn_mouse_scroll.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ooolearning_app/blocs/translation/translation_bloc.dart';
import 'package:ooolearning_app/blocs/translation/translation_event.dart';
import 'package:ooolearning_app/blocs/translation/translation_state.dart';
import 'package:ooolearning_app/repositories/translation_repository.dart';
import 'package:ooolearning_app/widgets/base_page.dart';
import 'package:ooolearning_app/widgets/loading_indicator.dart';

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
                            Text('Learn Japanese words!'),
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

  @override
  void initState() {
    super.initState();

    _translationBloc.add(TranslateTextEvent(text: 'something'));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TranslationBloc, TranslationState>(
      bloc: _translationBloc,
      builder: (context, state) {
        if (state is TranslationLoadingState) {
          return const LoadingIndicator();
        }

        if (state is TranslateTextDoneState) {
          return Text(state.text);
        }

        return Container();
      },
    );
  }
}
