import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:inherited_test_app/main.dart';

class ChangeNotifierService extends ChangeNotifier {
  bool isPink = true;

  void change() {
    isPink = !isPink;
    notifyListeners();
  }
}

class NotifierModel extends InheritedNotifier<ChangeNotifierService> {
  const NotifierModel(
      {super.key, required super.child, required super.notifier});

  static ChangeNotifierService? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<NotifierModel>()
        ?.notifier;
  }

  static ChangeNotifierService? read(BuildContext context) {
    final Widget? widget = context
        .getElementForInheritedWidgetOfExactType<NotifierModel>()
        ?.widget;
    return widget is NotifierModel ? widget.notifier : null;
  }
}

class JustContainer extends StatelessWidget {
  const JustContainer({super.key});

  @override
  Widget build(BuildContext context) {
    log('Build container');

    final ChangeNotifierService? model = NotifierModel.watch(context);

    return Container(
      color: model!.isPink ? Colors.pink : Colors.amber,
      width: 150,
      height: 150,
    );
  }
}

class JustText extends StatelessWidget {
  const JustText({super.key});

  @override
  Widget build(BuildContext context) {
    log('Build second text');
    return const Text('Second text');
  }
}

class JustButton extends StatelessWidget {
  const JustButton({super.key});

  @override
  Widget build(BuildContext context) {
    log('Build button');
    final ChangeNotifierService? service = NotifierModel.read(context);
    final inhWidget = MyInheritedWidget.of(context);

    return ElevatedButton(
        onPressed: () {
          log('Data from inherited widget: ${inhWidget?.value}');
          service!.change();
        },
        child: const Text('Button'));
  }
}
