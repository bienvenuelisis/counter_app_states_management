import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterNotifier extends ChangeNotifier {
  int value;

  bool loading = true;

  late SharedPreferences _storage;

  void increment() {
    value++;
    notifyListeners();
    _updateStorageValue();
  }

  void decrement() {
    value--;
    notifyListeners();
    _updateStorageValue();
  }

  void _updateStorageValue() {
    _storage.setInt("counter_key", value);
  }

  CounterNotifier(this.value) {
    _init();
  }

  Future<void> _init() async {
    await Future.delayed(const Duration(seconds: 3));
    _storage = await SharedPreferences.getInstance();
    value = _storage.getInt("counter_key") ?? 0;
    loading = false;
    notifyListeners();
  }
}
