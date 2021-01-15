import 'package:flutter/material.dart';
import 'package:vievif/models/user_model.dart';

class UserProvider with ChangeNotifier {
  String _email = '';
  String _password = '';
  bool _isLoggedIn;
  UserModel _user;

  String get email => _email;

  String get password => _password;

  bool get isLoggedIn => _isLoggedIn;

  UserModel get user => _user;

  void setEmail(String username) {
    _email = username;
    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  void setLoginStatus(bool status){
    _isLoggedIn = status;
    if(! _isLoggedIn) {
      _user = null;
    }
    notifyListeners();
  }

  void setUser(UserModel user) {
    _user = user;
    notifyListeners();
  }

}