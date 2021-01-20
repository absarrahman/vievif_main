import 'package:flutter/material.dart';
import 'package:vievif/models/user_model.dart';

class UserProvider with ChangeNotifier {
  String _email = '';
  String _password = '';
  bool _isLoggedIn = false;
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

  void setLoginStatus(bool status) {
    _isLoggedIn = status;
    if (!_isLoggedIn) {
      _user = null;
    }
    notifyListeners();
  }

  void setUser(UserModel user) {
    _user = user;
    notifyListeners();
  }

  void setUserFirstName(String value) {
    _user.firstName = value;
    notifyListeners();
  }

  void setUserLastName(String value) {
    _user.lastName = value;
    notifyListeners();
  }

  void setUserBillingCountryName(String value) {
    _user.billing.country = value;
    notifyListeners();
  }

  void setUserBillingAddress1(String value) {
    _user.billing.address1 = value;
    notifyListeners();
  }

  void setUserBillingAddress2(String value) {
    _user.billing.address2 = value;
    notifyListeners();
  }

  void setUserBillingCity(String value) {
    _user.billing.city = value;
    notifyListeners();
  }

  void setUserBillingPhone(String value) {
    _user.billing.phone = value;
    notifyListeners();
  }

}
