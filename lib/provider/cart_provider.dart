import 'package:flutter/material.dart';
import 'package:vievif/models/cart_model.dart';
import 'package:vievif/models/order_model.dart';
import 'package:vievif/models/product_model.dart';
import 'package:vievif/models/user_model.dart';
import 'package:vievif/models/variable_model.dart';
import 'package:vievif/services/api_service.dart';

class CartProvider with ChangeNotifier {
  List<CartModel> _cartItems = List();

  OrderModel _order;

  bool _isOrderConfirm;


  OrderModel get order => _order;

  bool get isOrderConfirm => _isOrderConfirm;

  List<CartModel> get cartItems => _cartItems;

  double _totalAmount = 0;

  double get totalAmount {
    _totalAmount = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      _totalAmount +=
          double.parse(_cartItems[i].product.price) * _cartItems[i].quantity;
    }
    return _totalAmount + (_totalAmount * 0.2);
  }

  void addProduct(
      {ProductModel product,
      int quantity,
      VariableModel variation,
      bool isAttribute1,
      bool isAttribute2,
      double price}) {
    var cartItem = CartModel(
        quantity: quantity,
        product: product,
        variation: variation,
        isAttribute1: isAttribute1,
        isAttribute2: isAttribute2,
        price: price);
    int itemIndex;
    if (variation != null) {
      itemIndex = (cartItems.indexWhere((element) =>
          element.product.id == product.id &&
          element.variation.id == variation.id));
    } else {
      itemIndex =
          (cartItems.indexWhere((element) => element.product.id == product.id));
    }
    if (itemIndex == -1) {
      _cartItems.add(cartItem);
    } else {
      var storeItem = _cartItems[itemIndex];
      _cartItems.removeAt(itemIndex);
      storeItem.quantity = quantity;
      _cartItems.add(storeItem);
    }
    notifyListeners();
  }

  void removeProduct(int index) {
    cartItems.removeAt(index);
    notifyListeners();
  }

  void setOrder(OrderModel order) {
    _order = order;
    notifyListeners();
  }

  void createOrder({UserModel user}) async {
    _cartItems.forEach((element) {
      print('Cart item loop ${element.variation.id}');
      _order.lineItems.add(
        LineItem(
          quantity: element.quantity,
          productId: element.product.id,
          variationId: element.variation.id,
        ),
      );
    });

    await ApiService().createOrder(order: _order, user: user).then((value) {
      if (value) {
        _isOrderConfirm = true;
        notifyListeners();
      }
    });
  }

  void emptyCart() {
    _cartItems.clear();
    notifyListeners();
  }

}
