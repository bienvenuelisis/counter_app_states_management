import 'package:flutter/material.dart';

CounterGlobal counterNotifiableGlobal = CounterGlobal(5);

class CounterGlobal extends ValueNotifier<int> {
  CounterGlobal(int value) : super(value);
}
