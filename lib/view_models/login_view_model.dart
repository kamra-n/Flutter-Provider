import 'package:flutter/material.dart';
import 'package:providerpractice/repository/auth_repository.dart';
import 'package:providerpractice/utils/utils.dart';

class LoginViewModel with ChangeNotifier {
  final _authRepo = AuthRepository();

  Future<void> loginApi(dynamic data, BuildContext context) async {
    try {
      print('Api calll start');
      dynamic value = await _authRepo.loginApi(data);
      print('Api call finisheed ${value['agent']['token']}');
      if (context.mounted) {
        Utils.flushBarSucessMessage(context, 'Success');
      }
    } catch (e) {
      print('error is $e');

      if (context.mounted) {
        Utils.flushBarErrorMessage(context, e.toString());
      }
    }
  }

  void printText() {
    print('Kamran here form Provider ');
    notifyListeners();
  }
}
