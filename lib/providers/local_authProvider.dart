import 'package:flutter/foundation.dart';
import 'package:flutter/foundation.dart';

class LocalAuth with ChangeNotifier {
  List<int> _pinInput = [];
  List<int> _correctPin = [1, 2, 3, 4];
  List<int> get pinInput {
    return [..._pinInput];
  }

  int pinInserted(int pin) {
    if (!isFull()) {
      _pinInput.add(pin);
    }
    notifyListeners();
    return pinInput.length;
  }

  void canclePressed() {
    if (!_pinInput.isEmpty) {
      _pinInput.removeLast();
    }
  }

  void clearPin() {
    _pinInput.clear();
    notifyListeners();
  }

  bool isCorrectPin() {
    return listEquals(_pinInput, _correctPin);
  }

  bool isFull() {
    if (_pinInput.length >= 4) return true;
    notifyListeners();
    return false;
  }
}
