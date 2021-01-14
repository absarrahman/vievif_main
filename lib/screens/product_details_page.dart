import 'package:flutter/material.dart';
import 'package:vievif/models/product_model.dart';
import 'package:vievif/models/variable_model.dart';
import 'package:vievif/services/api_service.dart';
import 'package:vievif/utils/colors.dart';
import 'package:vievif/widgets/common_widgets.dart';
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
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: kYellowish,
          ),
          SliverToBoxAdapter(
            child: widget.product.type == 'variable'
                ? FutureBuilder(
                    future: ApiService()
                        .getVariableProductList(widget.product.id.toString()),
                    builder:
                        (context, AsyncSnapshot<List<VariableModel>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Padding(
                          padding: EdgeInsets.only(top: (size.height/2.5)*1.0),
                          child: CommonWidgets.loading(),
                        );
                      } else if (snapshot.hasData) {
                        print('DATA VAR IS ${snapshot.data.toString()}');
                        return ProductDetailsWidget(
                          product: widget.product,
                          variableList: snapshot.data,
                        );
                      } else {
                        return Container();
                      }
                    })
                : ProductDetailsWidget(
                    product: widget.product,
                  ),
          )
        ],
      ),
    );
  }
}
