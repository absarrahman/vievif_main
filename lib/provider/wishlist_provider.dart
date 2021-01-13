import 'package:flutter/material.dart';
import 'package:vievif/models/product_model.dart';

class WishListProvider with ChangeNotifier {
  List<ProductModel> _productList=List();

  List<ProductModel> get productList => _productList;

  void addProduct(ProductModel productModel) {
    _productList.add(productModel);
    notifyListeners();
  }

  void removeProduct(ProductModel productModel) {
    _productList.remove(productModel);
    notifyListeners();
  }

}