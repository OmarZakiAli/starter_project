import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:starter_project/layout/layout.controller.dart';

import '../../features/auth/blocs/auth.controller.dart';
import '../../theme/themes.dart';
import '../../utils/local_storage.utils.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController(), fenix: true);
    Get.put(MainNavigationController(), permanent: true);
  }

  static Future initAsyncDependebcies() async {
    WidgetsFlutterBinding.ensureInitialized();

    await GetStorage.init();
    Get.put(LocalStorageUtils(), permanent: true);
    Get.put(ThemeService(), permanent: true);
    Get.find<ThemeService>().init();
  }
}
