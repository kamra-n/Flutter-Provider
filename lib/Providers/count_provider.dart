import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CountProvider with ChangeNotifier {
  int _countValue = 0;

  int get count => _countValue;

  void inCreaseCount() {
    _countValue = _countValue + 1;
    notifyListeners();
  }
}
