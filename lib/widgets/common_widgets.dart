import 'package:flutter/material.dart';
import 'package:vievif/utils/colors.dart';

class CommonWidgets {
  static Widget loading() {
    return Center(child: CircularProgressIndicator());
  }
  static Widget appbar() {
    return AppBar(
      automaticallyImplyLeading: true,
      backgroundColor: kYellowish,
      title: Image.asset('assets/images/logo.png',fit: BoxFit.cover,width: 200,),
      centerTitle: true,
    );
  }
}