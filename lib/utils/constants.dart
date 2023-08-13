import 'package:ooolearning_app/models/menu_option.dart';
import 'package:ooolearning_app/pages/cyrillic_page.dart';
import 'package:ooolearning_app/pages/japanese_words_page.dart';
import 'package:ooolearning_app/pages/japanese_page.dart';
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
      label: 'Japanese',
      route: JapanesePage.route,
      isEnabled: true,
    ),
    MenuOption(
      label: 'Japanese Words',
      route: JapaneseWordsPage.route,
      isEnabled: true,
    ),
    MenuOption(
      label: 'Morse',
      route: MorsePage.route,
      isEnabled: true,
    ),
  ];
}
