import 'package:flutter/material.dart';
import 'package:ooolearning_app/widgets/base_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const route = '/';

  @override
  Widget build(BuildContext context) {
    return const BasePage(child: Text('Home page'));
  }
}