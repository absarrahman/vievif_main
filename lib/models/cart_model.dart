import 'package:vievif/models/product_model.dart';
import 'package:vievif/models/variable_model.dart';

class CartModel {
  int quantity;
  ProductModel product;
  VariableModel variation;

  CartModel({this.quantity, this.product, this.variation});
}