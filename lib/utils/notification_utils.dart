import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starter_project/theme/themes.dart';
import 'package:starter_project/widgets/custom_button.dart';

import '../theme/app_colors.dart';

class NotificationUtils {
  static success(String message, {Function? onTap}) => showSnackBar(
        content: message.isEmpty ? "success".tr : message,
        backgroundColor: Colors.green,
      );

  static error(String message) => showSnackBar(
        content: message.isEmpty ? "error".tr : message,
        backgroundColor: Colors.red,
      );

  static fromNotification({String? title, String? body, Function? onTap}) {
    Get.snackbar(title ?? "", body ?? "",
        titleText: Text(
          title ?? "",
          style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontFamily: GoogleFonts.tajawal().fontFamily),
        ),
        messageText: Text(
          body ?? "",
          style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontFamily: GoogleFonts.tajawal().fontFamily),
        ),
        backgroundColor: Get.find<ThemeService>().isDarkMode
            ? AppColors.primaryDark
            : AppColors.primaryLight,
        isDismissible: true,
        colorText: Colors.white,
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        onTap: onTap == null
            ? null
            : (_) {
                onTap();
              });
  }

  static showLoading() {
    Get.dialog(
      const NewOverLay(),
    );
  }

  static hideLoading() {
    Get.back();
  }

  static showSnackBar(
      {String? content,
      Color? textColor,
      Color backgroundColor = Colors.black}) {
    Get.rawSnackbar(
        message: content,
        backgroundColor: backgroundColor,
        snackPosition: SnackPosition.BOTTOM);
  }

  static confirmDialog(
      {required String title,
      required String content,
      String? cancelText,
      String? confirmText,
      Function? onConfirm,
      Function? onCancel,
      Color? acceptColor,
      Color? rejectColor,
      bool dismissible = true}) {
    Get.defaultDialog(
      title: title,
      middleText: content,
      actions: [
        Row(
          children: [
            CustomButton(
              key: const ValueKey("confirm"),
              size: Get.width / 3,
              color: acceptColor ?? AppColors.failure,
              title: confirmText ?? "confirm".tr,
              onTap: () async {
                Get.back();
                if (onConfirm != null) {
                  await onConfirm();
                }
              },
            ),
            const SizedBox(
              width: 16,
            ),
            CustomButton(
              key: const ValueKey("confirm"),
              size: Get.width / 3,
              color: acceptColor ?? AppColors.failure,
              title: confirmText ?? "confirm".tr,
              onTap: () async {
                Get.back();
                if (onConfirm != null) {
                  await onConfirm();
                }
              },
            ),
          ],
        )
      ],
    );
  }
}

class NewOverLay extends StatefulWidget {
  const NewOverLay({Key? key}) : super(key: key);

  @override
  _NewOverLayState createState() => _NewOverLayState();
}

class _NewOverLayState extends State<NewOverLay> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: Center(
        child: Container(
          color: Colors.white,
          height: 70,
          width: 70,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: SpinKitFadingCube(
                size: 30.0,
                color: Get.find<ThemeService>().isDarkMode
                    ? AppColors.primaryDark
                    : AppColors.primaryLight,
                duration: const Duration(milliseconds: 1000),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
