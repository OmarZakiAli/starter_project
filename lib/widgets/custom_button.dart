import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter_project/theme/text_styles.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function onTap;
  final bool primary;
  final Color? color;
  final double? size;
  const CustomButton(
      {Key? key,
      required this.title,
      required this.onTap,
      this.color,
      this.primary = true,
      this.size})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
        onTap();
      },
      child: Container(
        width: size ?? Get.width,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: color ??
              (primary
                  ? Get.theme.primaryColor
                  : Get.theme.scaffoldBackgroundColor),
          borderRadius: BorderRadius.circular(10),
          border: primary ? null : Border.all(color: Get.theme.primaryColor),
        ),
        child: Center(
          child: Text(
            title.tr,
            style: Get.textTheme.subTitle.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
