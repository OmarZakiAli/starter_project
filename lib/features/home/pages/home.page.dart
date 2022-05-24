import 'package:flutter/material.dart';
import 'package:starter_project/widgets/app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: pageAppBar(title: "home", showOptions: true),
    );
  }
}
