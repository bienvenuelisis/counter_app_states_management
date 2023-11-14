import 'package:flutter/material.dart';

//int counterGlobal = 0;

CounterValue counterGlobal = CounterValue();

// * Modifier la valeur de notre état.

// * Notifier les widgets enfants du changement de la variable.

class CounterValue extends ValueNotifier<int> {
  CounterValue() : super(0);

  void increment() {
    value++;
  }
}
