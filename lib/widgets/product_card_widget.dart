import 'package:flutter/material.dart';
import 'package:vievif/models/product_model.dart';
import 'package:vievif/screens/product_details_page.dart';
import 'package:vievif/utils/colors.dart';

import 'common_widgets.dart';

class ProductCardWidget extends StatelessWidget {

  final product;


  ProductCardWidget({@required this.product});

  _navigateProductPage(ProductModel product, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailsPage(
          product: product,
        ),
      ),
    );
  }

  Widget vendorPanel(ProductModel product) {
    return Visibility(
      visible: product.store.vendorShopLogo!=null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(fit: FlexFit.loose,child: Image.network('https:${product.store.vendorShopLogo}',height: 20,)),
          SizedBox(
            width: 5,
          ),
          Flexible(child: Text(product.store.vendorDisplayName.toString()))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: GestureDetector(
          onTap: () => _navigateProductPage(product, context),
          child: Card(
              elevation: 7,
              color: kBackgroundWhite,
              borderOnForeground: true,
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Image.network(
                            'https:${product.images[0].src}',
                            height: size.height * 0.13,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: vendorPanel(product),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            '€${product.price}',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        //CommonWidgets.onSale(product),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 5,
                    child: Container(
                      height: 80,
                      width: 90,
                      child: CommonWidgets.onSale(product),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
