import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vievif/models/order_model.dart';
import 'package:vievif/models/user_model.dart';
import 'package:vievif/provider/cart_provider.dart';
import 'package:vievif/provider/payment_provider.dart';
import 'package:vievif/provider/user_provider.dart';
import 'package:vievif/screens/failure_page.dart';
import 'package:vievif/screens/success_page.dart';
import 'package:vievif/utils/colors.dart';

import '../common_widgets.dart';
import '../list_card_widget.dart';

class ConfirmOrderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);
    var paymentProvider = Provider.of<PaymentProvider>(context);
    var userProvider = Provider.of<UserProvider>(context);

    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      child: Column(
        children: [
          confirmNow(cartProvider:cartProvider, paymentProvider: paymentProvider, totalAmount: cartProvider.totalAmount,context: context,user: userProvider.user),
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

  Widget confirmNow({double totalAmount, PaymentProvider paymentProvider, BuildContext context, CartProvider cartProvider, UserModel user}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
              child: Text(
                'Total amount\n${CommonWidgets.numberFormatter(totalAmount.toString())}',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              )),
          SizedBox(
            width: 20,
          ),
          Flexible(
            child: RaisedButton(
              color: kRedColor,
              onPressed: () {
                //TODO NEED to navigate fail if condition not fulfilled
                if (paymentProvider.isCardPayment){
                  CommonWidgets.showToast(context: context,message: 'Payment is done');
                  OrderModel order = OrderModel(
                    setPaid: false,
                    paymentMethod: 'cod',
                    paymentMethodTitle: 'Cash on delivery',
                    lineItems: List(),
                    shipping: user.shipping,
                    billing: user.billing,
                    customerId: user.id,
                  );
                  cartProvider.setOrder(order);
                  cartProvider.createOrder();
                  //navigate to success page
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SuccessPage()));
                } else {
                  //FAILED
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FailurePage()));
                }
              },
              child: Text('Commander',style: TextStyle(
                color: kSurfaceWhite,
                fontSize: 15,
              ),),
              shape: StadiumBorder(),
            ),
          )
        ],
      ),
    );
  }
}
