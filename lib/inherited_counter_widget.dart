import 'package:flutter/material.dart';

class InheritedCounterWidget extends InheritedWidget {
  final Counter counter;

  const InheritedCounterWidget({
    super.key,
    required this.counter,
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant InheritedCounterWidget oldWidget) {
    return oldWidget.counter != counter;
  }
}

class Counter {
  int value = 0;

  void increments() {
    value++;
  }

  Counter();
}
