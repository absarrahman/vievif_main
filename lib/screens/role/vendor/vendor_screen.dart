import 'package:flutter/material.dart';
import 'package:vievif/models/user_model.dart';

class VendorPage extends StatelessWidget {

  final UserModel user;

  VendorPage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Container(child: Text('Vendor'))),
    );
  }
}
