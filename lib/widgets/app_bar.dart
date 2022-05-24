import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter_project/layout/options_menu.dart';

AppBar pageAppBar({required String title, bool showOptions = false}) {
  return AppBar(
    title: Text(title.tr),
    centerTitle: true,
    actions: !showOptions ? null : [const OptionsMenuWidget()],
  );
}
