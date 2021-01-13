import 'package:flutter/material.dart';
import 'package:vievif/models/user_model.dart';

class CustomerPage extends StatelessWidget {

  final UserModel user;


  CustomerPage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Container(child: Text('Customer'))),
    );
  }
}
