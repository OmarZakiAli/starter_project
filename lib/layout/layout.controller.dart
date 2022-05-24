import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

import '../features/home/pages/home.page.dart';

class MainNavigationController extends GetxController {
  int currentIndex = 0;

  final List<PageData> pages = [
    PageData(icon: FontAwesome.home, page: const HomePage(), title: "home"),
    PageData(icon: FontAwesome.user, page: Container(), title: "profile"),
    PageData(
        icon: Icons.notifications, page: Container(), title: "notifications"),
  ];

  PageData get currentPage {
    return pages[currentIndex];
  }

  changeIndex(int index) {
    currentIndex = index;
    update();
  }
}

class PageData {
  Widget page;
  String title;
  IconData icon;
  PageData({required this.icon, required this.page, required this.title});
}
