import 'package:flutter/material.dart';

class InheritedCounterWidget extends InheritedWidget {
  final Counter counter;

  const InheritedCounterWidget({
    super.key,
    required this.counter,
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    debugPrint(oldWidget.toString());
    return false;
  }
}

class Counter {
  int value;

  Counter(this.value);

  void increment() {
    value++;
  }

  void decrement() {
    value--;
  }
}
