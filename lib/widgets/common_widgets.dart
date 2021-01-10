import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:vievif/models/product_model.dart';
import 'package:vievif/utils/colors.dart';

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
              'SALE',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: kBackgroundWhite,
              ),
            ),
          ),
        ),
      ),
    );
  }
}