import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String _email = '';
  String _password = '';

  String get email => _email;

  String get password => _password;

  void setEmail(String username) {
    _email = username;
    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }

}