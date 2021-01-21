import 'package:flutter/material.dart';
import 'package:vievif/models/user_model.dart';
import 'package:vievif/screens/role/admin/admin_screen.dart';
import 'package:vievif/screens/role/customer/customer_screen.dart';
import 'package:vievif/screens/role/delivery/delivery_screen.dart';
import 'package:vievif/screens/role/vendor/vendor_screen.dart';


import 'config.dart';

class UserRoute {
  static navigateUserScreen({UserModel user, BuildContext context, bool isFromLoginPage}) {
    switch (user.role) {
      case UserType.admin:
        if(isFromLoginPage) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => AdminPage(user)));
        } else {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AdminPage(user)));
        }
        return;
      case UserType.deliveryMan:
        if (isFromLoginPage) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => DeliveryPage(user)));
        } else {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DeliveryPage(user)));
        }
        return;
      case UserType.vendor:
        if (isFromLoginPage) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => VendorPage(user)));
        } else {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => VendorPage(user)));
        }
        return;
      case UserType.customer:
        if(isFromLoginPage) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => CustomerPage(user)));
        } else {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CustomerPage(user)));
        }
        return;
      default:
        return;
    }
  }
}
