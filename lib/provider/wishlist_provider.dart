import 'package:flutter/material.dart';
import 'package:vievif/models/product_model.dart';

class WishListProvider with ChangeNotifier {
  List<ProductModel> _productList = List();
  List<int> _productIDList = List();

  List<ProductModel> get productList => _productList;
  List<int> get productIDList => _productIDList;

  void addProduct(ProductModel productModel) {
    _productList.add(productModel);
    _productIDList.add(productModel.id);
    notifyListeners();
  }

  void removeProduct(ProductModel productModel) {
    _productList.remove(productModel);
    _productIDList.remove(productModel.id);
    notifyListeners();
  }

}