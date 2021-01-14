import 'package:flutter/material.dart';
import 'package:vievif/models/cart_model.dart';
import 'package:vievif/models/product_model.dart';
import 'package:vievif/models/variable_model.dart';

class CartProvider with ChangeNotifier {
  List<CartModel> _cartItems = List();
  List<int> _variationId = List();

  List<CartModel> get cartItems => _cartItems;


  List<int> get variationId => _variationId;

  void addProduct({ProductModel product, int quantity, VariableModel variation}) {
    var cartItem = CartModel(quantity: quantity,product: product,variation:variation);
    int itemIndex = (cartItems.indexWhere((element) => element.product.id == product.id && element.variation.id == variation.id));
    if (itemIndex == -1){
      _cartItems.add(cartItem);
      _variationId.add(variation.id);
    } else {
      var storeItem = _cartItems[itemIndex];
      _cartItems.removeAt(itemIndex);
      storeItem.quantity = quantity;
      _cartItems.add(storeItem);
    }
    notifyListeners();
  }

}