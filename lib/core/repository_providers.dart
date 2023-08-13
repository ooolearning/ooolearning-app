import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:ooolearning_app/interceptors/auth_interceptor.dart';
import 'package:ooolearning_app/repositories/theme_repository.dart';
import 'package:ooolearning_app/repositories/translation_repository.dart';
import 'package:ooolearning_app/utils/api.dart';

class RepositoryProviders extends StatelessWidget {
  RepositoryProviders({
    super.key,
    required this.child,
  });

  final Widget child;

  final _translationApi = Api(
    authority: '',
    client: InterceptedClient.build(interceptors: [
      AuthInterceptor(),
    ]),
  );

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ThemeRepository>(
          create: (context) => ThemeRepository(),
        ),
        RepositoryProvider<TranslationRepository>(
          create: (context) => TranslationRepository(api: _translationApi),
        ),
      ],
      child: child,
    );
  }
}
