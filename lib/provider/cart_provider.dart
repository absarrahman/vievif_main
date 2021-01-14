import 'package:flutter/material.dart';
import 'package:vievif/models/cart_model.dart';
import 'package:vievif/models/product_model.dart';

class CartProvider with ChangeNotifier {
  List<CartModel> _cartItems;
  List<ProductModel> _products;
  List<CartModel> get cartItems => _cartItems;

  void addProduct({ProductModel product, int quantity}) {
    var cartItem = CartModel(quantity, product);
    if (_products.contains(product)) {
      _products.add(product);
      
    }
  }

}