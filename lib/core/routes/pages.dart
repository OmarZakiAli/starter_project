import 'package:get/get.dart';
import 'package:starter_project/core/routes/routes.dart';

import '../../features/auth/pages/login.page.dart';
import '../../features/auth/pages/register.page.dart';
import '../../features/auth/pages/splash.page.dart';
import '../../layout/main_navigation.layout.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(name: Routes.splash, page: () => const SplashPage()),
    GetPage(name: Routes.login, page: () => const LoginPage()),
    GetPage(name: Routes.register, page: () => const RegisterPage()),
    GetPage(name: Routes.main, page: () => const MainNavigationLayout()),
  ];
}
