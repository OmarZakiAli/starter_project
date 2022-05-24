import 'package:get/get.dart';
import 'package:starter_project/theme/themes.dart';

class AppAssets {
  static const String logoB = "assets/images/logo.png";
  static const String logoW = "assets/images/logo_w.png";

  static String get logo {
    return Get.find<ThemeService>().isDarkMode ? logoW : logoB;
  }
}
