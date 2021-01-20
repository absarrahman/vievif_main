import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vievif/models/user_model.dart';
import 'package:vievif/provider/user_provider.dart';
import 'package:vievif/screens/navigation_page.dart';
import 'package:vievif/screens/role/customer/order_confirmation_page.dart';
import 'package:vievif/utils/colors.dart';
import 'package:vievif/widgets/common_widgets.dart';

import '../../order/order_page.dart';

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
          SliverPadding(padding: EdgeInsets.all(8)),
          SliverList(delegate: SliverChildListDelegate(
            [
              CommonWidgets.clickButton(
                context: context,
                iconData: Icons.shopping_bag,
                widget: OrderPage(),
                title: 'Commandes',
              ),
            ]
          ))
        ],
      ),
    );
  }

}
