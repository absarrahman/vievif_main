import 'package:flutter/material.dart';
import 'package:vievif/models/user_model.dart';

class AdminPage extends StatelessWidget {
  final UserModel user;

  AdminPage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Container(child: Text('Admin'))),
    );
  }
}
