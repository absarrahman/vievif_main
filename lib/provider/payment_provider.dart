import 'package:flutter/material.dart';

class PaymentProvider with ChangeNotifier {
  bool _isCardPayment = true;

  bool get isCardPayment => _isCardPayment;

  void setIsCardPayment(bool value) {
    _isCardPayment = value;
    notifyListeners();
  }

}