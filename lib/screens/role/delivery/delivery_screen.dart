import 'package:flutter/material.dart';
import 'package:vievif/models/user_model.dart';

class DeliveryPage extends StatelessWidget {
  final UserModel user;


  DeliveryPage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Container(child: Text('Delivery'))),
    );
  }
}
