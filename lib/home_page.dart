import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:inherited_test_app/components.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    log('Build home page');
    return NotifierModel(
        notifier: ChangeNotifierService(),
        child: Scaffold(
          body: SafeArea(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              SizedBox(width: double.infinity),
              JustContainer(),
              JustText(),
              JustButton(),
            ],
          )),
        ));
  }
}
