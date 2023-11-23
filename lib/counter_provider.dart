import 'package:flutter/foundation.dart';

class CounterProvider extends ChangeNotifier {
  int _value = 0;

  int get value => _value;

  void decrement() {
    _value--;
    notifyListeners();
  }

  void increment() {
    _value++;
    notifyListeners();
  }
}
