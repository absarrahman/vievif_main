import 'package:flutter/material.dart';
import 'package:vievif/models/user_model.dart';
import 'package:vievif/models/vendor_product_model.dart';
import 'package:vievif/services/api_service.dart';
import 'package:vievif/utils/colors.dart';
import 'package:vievif/widgets/common_widgets.dart';

class VendorProductPage extends StatelessWidget {
  final UserModel user;

  VendorProductPage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appbar(),
      body: FutureBuilder(
          future: ApiService().getVendorProducts(id: user.id, user: user),
          builder: (context, AsyncSnapshot<List<VendorProductModel>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CommonWidgets.loading();
            } else {
              return _productList(
                snapshot.data,
                context,
              );
            }
          }),
    );
  }

  Widget _productList(List<VendorProductModel> itemList, BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Container(
      height: height,
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          Flexible(
            child: GridView.count(
              crossAxisCount: 2,
              scrollDirection: Axis.vertical,
              physics: ClampingScrollPhysics(),
              children: itemList
                  .map(
                    (VendorProductModel product) => card(product, context),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget card(VendorProductModel product, BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Card(
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
                    child: Text(
                      product.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
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
                child: onSale(product),
              ),
            ),
          ],
        ));
  }

  Widget onSale(VendorProductModel product) {
    return Visibility(
      visible: product.onSale,//if discount exist then it wil show
      child: Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 100,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: kRedColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              'Promo!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: kBackgroundWhite,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
