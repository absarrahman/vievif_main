import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vievif/models/product_model.dart';
import 'package:vievif/utils/colors.dart';
import 'package:vievif/widgets/product_card_widget.dart';

class CommonWidgets {
  static Widget loading() {
    //return Center(child: CircularProgressIndicator());
    return SpinKitDualRing(
      size: 40,
      color: kRedColor,
    );
  }
  static Widget appbar() {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: true,
      backgroundColor: kYellowish,
      //title: Image.asset('assets/images/logo.png',fit: BoxFit.cover,width: 200,),
      centerTitle: true,
    );
  }

  static Widget onSale(ProductModel product) {
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

  static Widget rowProducts(List<ProductModel> products) {
    return Container(
      height: 200,
      child: ListView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
          itemBuilder: (context, index) {
            var product = products[index];
            return ProductCardWidget(product: product);
          }),
    );
  }

  static Widget header(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  static Widget vendorPanel(ProductModel product) {
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

  static String numberFormatter(String value) {
    return FlutterMoneyFormatter(
        amount: double.parse(value),
        settings: MoneyFormatterSettings(
          //symbol: '€',
            thousandSeparator: '.',
            decimalSeparator: ',',
            symbolAndNumberSeparator: ' ',
            fractionDigits: 2,
            compactFormatType: CompactFormatType.short))
        .output
        .nonSymbol + '€';
  }

  static Widget clickButton({IconData iconData,BuildContext context, Widget widget, String title}) {
    return InkWell(
      onTap: () => _route(context, widget),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      iconData,
                      color: Colors.grey,
                      size: 25,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.chevron_right,
                size: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  static _route(BuildContext context, Widget widget) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => widget));
  }

  static showToast({String message, BuildContext context,}) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

}