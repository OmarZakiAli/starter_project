import 'package:get_storage/get_storage.dart';

class LocalStorageUtils {
  final String _token = "token";
  final String _locale = "locale";
  final String _isDarkMode = "isDarkMode";
  final String _firstTime = "firstTime";

  String? get token {
    return GetStorage().read(_token);
  }

  String get locale {
    return GetStorage().read(_locale) ?? "ar";
  }

  bool? get isDarkMode {
    return GetStorage().read(_isDarkMode);
  }

  bool get firstTime {
    return GetStorage().read(_firstTime) ?? true;
  }

  setToken(String? token) async {
    await GetStorage().write(_token, token);
  }

  setLocale(String locale) async {
    await GetStorage().write(_locale, locale);
  }

  setIsDarkMode(bool isDarkMode) async {
    await GetStorage().write(_isDarkMode, isDarkMode);
  }

  setFirstTime(bool firstTime) async {
    await GetStorage().write(_firstTime, firstTime);
  }
}
