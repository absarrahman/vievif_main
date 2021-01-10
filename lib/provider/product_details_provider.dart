import 'package:flutter/material.dart';
import 'package:vievif/models/product_model.dart';

class ProductDetailsProvider with ChangeNotifier {
  String _selectedColor;
  ProductModel product;

  String get selectedColor => _selectedColor;

  void setSelectedColor(String color) {
    _selectedColor = color;
    notifyListeners();
  }

}