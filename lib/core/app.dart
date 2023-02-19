import 'package:flutter/material.dart';
import 'package:ooolearning_app/pages/home_page.dart';
import 'package:ooolearning_app/utils/constants.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
      routes: {
        '/': (context) => const HomePage(),
      },
    );
  }
}
