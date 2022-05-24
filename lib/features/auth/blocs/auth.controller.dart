import 'package:get/get.dart';
import 'package:starter_project/core/routes/routes.dart';

class AuthController extends GetxController {
  login() {
    Get.offAllNamed(Routes.main);
  }
}
