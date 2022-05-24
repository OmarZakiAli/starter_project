import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter_project/theme/text_styles.dart';

import '../widgets/bottom_bar.dart';
import 'layout.controller.dart';

class MainNavigationLayout extends GetView<MainNavigationController> {
  const MainNavigationLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainNavigationController>(builder: (_) {
      return Scaffold(
          bottomNavigationBar: BottomBar(
              showActiveBackgroundColor: false,
              duration: const Duration(milliseconds: 100),
              itemPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              backgroundColor: context.theme.scaffoldBackgroundColor,
              selectedIndex: controller.currentIndex,
              onTap: (i) {
                controller.changeIndex(i);
              },
              items: controller.pages.map<BottomBarItem>((pageData) {
                return BottomBarItem(
                    key: ValueKey(pageData.title),
                    icon: Icon(
                      pageData.icon,
                      size: 20,
                    ),
                    // inactiveColor: AppColors.headingLight,
                    title: Text(
                      pageData.title.tr,
                      style: context.textTheme.subTitleBold
                          .copyWith(color: context.theme.primaryColor),
                    ),
                    activeColor: context.theme.primaryColor);
              }).toList()),
          body: controller.currentPage.page);
    });
  }
}
