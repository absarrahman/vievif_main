import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vievif/provider/cart_provider.dart';
import 'package:vievif/utils/colors.dart';

import '../common_widgets.dart';
import '../list_card_widget.dart';

class ConfirmOrderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      child: Column(
        children: [
          Text(
            'Total amount\n${CommonWidgets.numberFormatter(cartProvider.totalAmount.toString())}',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10,
          ),
          Flexible(
            child: ListView.builder(
                itemCount: cartProvider.cartItems.length,
                itemBuilder: (context, index) {
                  final cart = cartProvider.cartItems[index];
                  return CartListCard(
                    cart: cart,
                  );
                }),
          ),
        ],
      ),
    );
  }
}
