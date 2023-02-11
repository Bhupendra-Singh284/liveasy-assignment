import 'package:flutter/material.dart';

class UserDetails with ChangeNotifier {
  String _phNUmber = "";
  String showNumber() {
    return _phNUmber;
  }

  void setPhoneNumber(String num) {
    _phNUmber = num;
    notifyListeners();
  }
}
