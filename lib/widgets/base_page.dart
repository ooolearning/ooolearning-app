import 'package:flutter/material.dart';
import 'package:ooolearning_app/pages/home_page.dart';
import 'package:ooolearning_app/utils/constants.dart';
import 'package:ooolearning_app/widgets/app_title.dart';

class MenuOption {
  const MenuOption({
    required this.isEnabled,
    required this.label,
    required this.route,
  });

  final bool isEnabled;
  final String label;
  final String route;
}

class BasePage extends StatelessWidget {
  const BasePage({
    super.key,
    required this.child,
  });

  final Widget child;

  final _menuOptions = const <MenuOption>[
    MenuOption(
      label: 'Binary (soon)',
      route: HomePage.route,
      isEnabled: false,
    ),
    MenuOption(
      label: 'Japanese (soon)',
      route: HomePage.route,
      isEnabled: false,
    ),
    MenuOption(
      label: 'Morse (soon)',
      route: HomePage.route,
      isEnabled: false,
    ),
    MenuOption(
      label: 'Russian (soon)',
      route: HomePage.route,
      isEnabled: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    const appTitle = AppTitle();

    return Scaffold(
      appBar: AppBar(title: appTitle),
      body: child,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppBar(
                title: appTitle,
                automaticallyImplyLeading: false,
              ),
              ListTile(
                title: const Text('Home'),
                onTap: () async {
                  await Navigator.of(context)
                      .pushReplacementNamed(HomePage.route);
                },
              ),
              const Divider(height: 0),
              ..._menuOptions.map((e) {
                return ListTile(
                  title: Text(e.label),
                  enabled: e.isEnabled,
                  onTap: e.isEnabled
                      ? () async {
                          await Navigator.of(context)
                              .pushReplacementNamed(e.route);
                        }
                      : null,
                );
              }),
              const Divider(height: 0),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  '2023, ${Constants.appName}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
