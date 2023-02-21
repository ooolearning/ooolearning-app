import 'package:flutter/material.dart';
import 'package:ooolearning_app/pages/cyrillic_page.dart';
import 'package:ooolearning_app/pages/home_page.dart';
import 'package:ooolearning_app/pages/morse_page.dart';
import 'package:ooolearning_app/utils/constants.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
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
  }
}
