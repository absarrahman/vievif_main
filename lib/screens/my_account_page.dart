import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vievif/models/user_model.dart';
import 'package:vievif/provider/user_provider.dart';
import 'package:vievif/screens/success_page.dart';
import 'package:vievif/screens/terms_condition_page.dart';
import 'package:vievif/services/user_route.dart';
import 'package:vievif/utils/colors.dart';
import 'package:vievif/widgets/common_widgets.dart';

import 'auth/login.dart';
import 'cart_page.dart';

class MyAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            pinned: true,
            backgroundColor: kYellowish,
            expandedHeight: 150.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.cover,
                  width: 250,
                ),
              ),
              centerTitle: true,
              title: Text('Mon compete'),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(
                  height: 10,
                ),
                userProvider.user == null
                    ? CommonWidgets.clickButton(
                        iconData: Icons.person,
                        context: context,
                        widget: LoginPage(),
                        title: 'Login')
                    : _goToAccount(
                        iconData: Icons.person,
                        user: userProvider.user,
                        context: context),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CommonWidgets.header('Réglages Généraux'),
                ),
                SizedBox(
                  height: 20,
                ),
                CommonWidgets.clickButton(
                    iconData: Icons.shopping_cart,
                    context: context,
                    widget: CartPage(),
                    title: 'Mon panier'),
                SizedBox(
                  height: 10,
                ),
                CommonWidgets.clickButton(
                    iconData: Icons.security,
                    context: context,
                    widget: TermsAndConditionPage(),
                    title: 'Termes et Conditions \nde Vievif'),
                CommonWidgets.clickButton(
                    iconData: Icons.security,
                    context: context,
                    widget: SuccessPage(),
                    title: 'Termes et Conditions \nde Vievif'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _goToAccount(
      {IconData iconData, BuildContext context, UserModel user}) {
    return InkWell(
      onTap: () => UserRoute.navigateUserScreen(
          user: user, context: context, isFromLoginPage: false),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      iconData,
                      color: Colors.grey,
                      size: 25,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      user.username,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.chevron_right,
                size: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
