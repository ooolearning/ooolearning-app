import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ooolearning_app/blocs/theme/theme_bloc.dart';
import 'package:ooolearning_app/blocs/theme/theme_state.dart';
import 'package:ooolearning_app/core/bloc_providers.dart';
import 'package:ooolearning_app/core/repository_providers.dart';
import 'package:ooolearning_app/pages/cyrillic_page.dart';
import 'package:ooolearning_app/pages/home_page.dart';
import 'package:ooolearning_app/pages/morse_page.dart';
import 'package:ooolearning_app/utils/constants.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProviders(
      child: BlocProviders(
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            return MaterialApp(
              title: Constants.appName,
              themeMode: state.themeMode,
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                fontFamily: 'Poppins',
                brightness: Brightness.light,
                primarySwatch: Colors.blue,
              ),
              darkTheme: ThemeData(
                fontFamily: 'Poppins',
                brightness: Brightness.dark,
                primarySwatch: Colors.blue,
              ),
              routes: {
                // Home page.
                HomePage.route: (context) => const HomePage(),

                // Flash card pages.
                CyrillicPage.route: (context) => const CyrillicPage(),
                MorsePage.route: (context) => const MorsePage(),
              },
            );
          },
        ),
      ),
    );
  }
}
