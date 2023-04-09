import 'package:flutter/material.dart';
import 'package:inherited_test_app/home_page.dart';

void main() {
  const MyInheritedWidget a = MyInheritedWidget(
      value: 'Im stored in Inherited widget', child: MainApp());
  runApp(a);
}

class MyInheritedWidget extends InheritedWidget {
  final String value;

  const MyInheritedWidget(
      {super.key, required this.value, required super.child});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static MyInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
