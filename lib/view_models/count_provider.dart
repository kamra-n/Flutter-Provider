import 'package:flutter/material.dart';
import 'package:providerpractice/utils/utils.dart';

class CountProvider with ChangeNotifier {
  int _countValue = 0;

  int get count => _countValue;

  void inCreaseCount(BuildContext context) {
    Utils.flushBarErrorMessage(context, 'Value added');
    _countValue = _countValue + 1;
    notifyListeners();
  }
}
