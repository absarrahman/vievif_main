import 'package:vievif/models/product_model.dart';
import 'package:vievif/models/variable_model.dart';

class CartModel {
  int quantity;
  ProductModel product;
  VariableModel variation;
  bool isAttribute1,isAttribute2;
  double price;

  CartModel({this.quantity, this.product, this.variation, this.isAttribute1, this.isAttribute2, this.price});
}