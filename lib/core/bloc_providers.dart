import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ooolearning_app/blocs/theme/theme_bloc.dart';
import 'package:ooolearning_app/repositories/theme_repository.dart';

class BlocProviders extends StatelessWidget {
  const BlocProviders({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc(
            themeRepository: RepositoryProvider.of<ThemeRepository>(context),
          ),
        ),
      ],
      child: child,
    );
  }
}
