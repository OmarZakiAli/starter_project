import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:starter_project/translations/app_translations.dart';

import 'core/routes/app_binding.dart';
import 'core/routes/pages.dart';
import 'core/routes/routes.dart';
import 'theme/themes.dart';

main() async {
  await AppBindings.initAsyncDependebcies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'starter app',
      themeMode: Get.find<ThemeService>().themeMode,
      theme: Themes.light,
      darkTheme: Themes.dark,
      getPages: AppPages.pages,
      defaultTransition: Transition.cupertino,
      initialRoute: Routes.splash,
      debugShowCheckedModeBanner: false,
      initialBinding: AppBindings(),
      translations: AppTranslations(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate
      ],
      smartManagement: SmartManagement.keepFactory,
      locale: Locale(Get.find<ThemeService>().locale),
      fallbackLocale: const Locale("ar"),
      supportedLocales: const [Locale("ar"), Locale("en")],
    );
  }
}
