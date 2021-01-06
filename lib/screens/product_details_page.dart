import 'package:flutter/material.dart';
import 'package:vievif/models/product_model.dart';
import 'package:vievif/utils/colors.dart';
import 'package:vievif/widgets/product_details_widget.dart';

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
      appBar: AppBar(
        backgroundColor: kYellowish,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top:8.0),
        child: ProductDetailsWidget(widget.product),
      ),
    );
  }
}
