import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/local_storage.utils.dart';
import 'app_colors.dart';

class Themes {
  static TabBarTheme tabBarTheme = TabBarTheme(
      labelColor: Colors.white,
      labelStyle: TextStyle(
          fontFamily: GoogleFonts.tajawal().fontFamily,
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 18));
  static const darkOverlay = SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
      statusBarColor: Colors.transparent);

  static const lightOverlay = SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
      statusBarColor: Colors.transparent);

  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    tabBarTheme: tabBarTheme,
    colorScheme: const ColorScheme.dark(),
    scaffoldBackgroundColor: AppColors.backgroundDark,
    fontFamily: GoogleFonts.tajawal().fontFamily,
    primaryColor: AppColors.primaryDark,
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.primaryDark,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      systemOverlayStyle: darkOverlay,
      titleTextStyle: TextStyle(
          fontFamily: GoogleFonts.tajawal().fontFamily,
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600),
    ),
  );

  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    colorScheme: const ColorScheme.light(),
    primaryColor: AppColors.primaryLight,
    tabBarTheme: tabBarTheme,
    fontFamily: GoogleFonts.tajawal().fontFamily,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      systemOverlayStyle: lightOverlay,
      titleTextStyle: TextStyle(
          fontFamily: GoogleFonts.tajawal().fontFamily,
          color: Colors.blueGrey.shade800,
          fontSize: 16,
          fontWeight: FontWeight.w600),
    ),
  );
}

class ThemeService {
  init() {
    SystemChrome.setSystemUIOverlayStyle(
        isDarkMode ? Themes.darkOverlay : Themes.lightOverlay);
  }

  String get locale {
    return (Get.find<LocalStorageUtils>().locale);
  }

  bool get isDarkMode {
    return (Get.find<LocalStorageUtils>().isDarkMode) ?? false;
  }

  ThemeMode get themeMode => isDarkMode ? ThemeMode.dark : ThemeMode.light;

  void switchTheme() async {
    bool mode = !isDarkMode;
    await Get.find<LocalStorageUtils>().setIsDarkMode(mode);
    Get.changeThemeMode(mode ? ThemeMode.dark : ThemeMode.light);
  }

  void changeLocale() async {
    String localex = locale;
    if (localex == "ar") {
      localex = "en";
    } else {
      localex = "ar";
    }
    await Get.find<LocalStorageUtils>().setLocale(localex);
    Get.updateLocale(Locale(localex));
  }
}
