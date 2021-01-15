import 'package:flutter/material.dart';
import 'package:vievif/screens/home.dart';
import 'package:vievif/screens/my_account_page.dart';
import 'package:vievif/screens/product_page.dart';
import 'package:vievif/screens/wishlist_page.dart';
import 'package:vievif/utils/colors.dart';

import 'cart_page.dart';

class NavigationPage extends StatefulWidget {
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int tabIndex = 0;
  List<Widget> _navigateTabList = [
    HomePage(),
    ProductPage(),
    WishListPage(),
    MyAccountPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Accueil'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined), label: 'Tous les produits'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_outlined), label: 'Envies'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Mon compte'),
        ],
        currentIndex: tabIndex,
        onTap: (index) {
          setState(() {
            tabIndex = index;
          });
        },
        type: BottomNavigationBarType.shifting,
        selectedFontSize: 15,
        unselectedFontSize: 10,
        selectedItemColor: kYellowish,
        unselectedItemColor: kRedColor,
      ),
      body: _navigateTabList.elementAt(tabIndex),
    );
  }
}
