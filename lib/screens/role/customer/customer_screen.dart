import 'package:flutter/material.dart';
import 'package:vievif/models/user_model.dart';
import 'package:vievif/screens/role/customer/test.dart';
import 'package:vievif/utils/colors.dart';

class CustomerPage extends StatelessWidget {
  final UserModel user;

  CustomerPage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: kYellowish,
            flexibleSpace: FlexibleSpaceBar(
              background: Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.cover,
                  width: 250,
                ),
              ),
              centerTitle: true,
              title: Text('Bonjour, ${user.username}'),
            ),
            expandedHeight: 200,
          ),
          SliverList(delegate: SliverChildListDelegate(
            [
              Container(
                  color: kYellowish,
                  child: FlatButton(onPressed: () => goTO(context), child: Text("OK"))),
            ]
          ))
        ],
      ),
    );
  }

  goTO(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context)=> TestPage()));
  }
}
