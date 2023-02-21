import 'package:ooolearning_app/models/menu_option.dart';
import 'package:ooolearning_app/pages/cyrillic_page.dart';
import 'package:ooolearning_app/pages/morse_page.dart';

class Constants {
  static const appName = 'ooo Learning';

  static const menuOptions = <MenuOption>[
    MenuOption(
      label: 'Binary (soon)',
      route: '',
      isEnabled: false,
    ),
    MenuOption(
      label: 'Cyrillic',
      route: CyrillicPage.route,
      isEnabled: true,
    ),
    MenuOption(
      label: 'Japanese (soon)',
      route: '',
      isEnabled: false,
    ),
    MenuOption(
      label: 'Morse',
      route: MorsePage.route,
      isEnabled: true,
    ),
  ];
}
