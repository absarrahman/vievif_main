import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vievif/models/product_model.dart';
import 'package:vievif/provider/cart_provider.dart';
import 'package:vievif/screens/product_details_page.dart';
import 'package:vievif/utils/colors.dart';
import 'package:vievif/widgets/common_widgets.dart';
import 'package:vievif/widgets/list_card_widget.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);
    print('CART LENGTH is ${cartProvider.cartItems.length}');
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CommonWidgets.appbar(),
      body: cartProvider.cartItems != null && cartProvider.cartItems.length > 0
          ? Column(
              children: [
                Container(
                  width: size.width,
                  child: buyNow(cartProvider.totalAmount),
                  color: kYellowish,
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: cartProvider.cartItems.length,
                      itemBuilder: (context, index) {
                        var cart = cartProvider.cartItems[index];
                        return GestureDetector(
                          onTap: () =>
                              _navigateProductPage(cart.product, context),
                          child: CartListCard(
                            cart: cart,
                          ),
                        );
                      }),
                ),
              ],
            )
          : Center(
              child: Container(
                child: Text(
                  'Aucun article dans le panier.',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
    );
  }

  Widget buyNow(double totalAmount) {
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
              onPressed: () => {},
              child: Text('Valider la commande',style: TextStyle(
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

  _navigateProductPage(ProductModel product, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailsPage(
          product: product,
        ),
      ),
    );
  }
}
