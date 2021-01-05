import 'package:flutter/material.dart';
import 'package:vievif/models/product_model.dart';

class ProductDetailsPage extends StatefulWidget {
  final ProductModel product;


  ProductDetailsPage({this.product});

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(widget.product.name),
      ),
    );
  }
}
