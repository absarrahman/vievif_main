import 'package:flutter/material.dart';
import 'package:vievif/models/user_model.dart';
import 'package:vievif/screens/order/order_page.dart';
import 'package:vievif/utils/colors.dart';
import 'package:vievif/widgets/common_widgets.dart';

class DeliveryPage extends StatelessWidget {
  final UserModel user;


  DeliveryPage(this.user);

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
                //logOutButton(title: 'Se deconnecter',context: context,iconData: Icons.logout,widget: NavigationPage(),),
              ]
          ))
        ],
      ),
    );
  }
}
