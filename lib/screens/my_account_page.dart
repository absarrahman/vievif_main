import 'package:flutter/material.dart';
import 'package:vievif/screens/terms_condition_page.dart';
import 'package:vievif/screens/wishlist_page.dart';
import 'package:vievif/utils/colors.dart';
import 'package:vievif/widgets/common_widgets.dart';

import 'auth/login.dart';
import 'cart_page.dart';

class MyAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                clickButton(iconData: Icons.person,
                  context: context,
                  widget: LoginPage(),
                  title: 'Login'
                ),
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
                clickButton(iconData: Icons.shopping_cart,
                  context: context,
                  widget: CartPage(),
                  title: 'Mon panier'
                ),
                SizedBox(
                  height: 10,
                ),
                clickButton(iconData: Icons.security,
                    context: context,
                    widget: TermsAndConditionPage(),
                    title: 'Termes et Conditions \nde Vievif'
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget clickButton({IconData iconData,BuildContext context, Widget widget, String title}) {
    return InkWell(
      onTap: () => _login(context, widget),
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
                      title,
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

  _login(BuildContext context, Widget widget) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => widget));
  }
}
