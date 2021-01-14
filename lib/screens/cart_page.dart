import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vievif/models/product_model.dart';
import 'package:vievif/provider/cart_provider.dart';
import 'package:vievif/screens/product_details_page.dart';
import 'package:vievif/widgets/common_widgets.dart';
import 'package:vievif/widgets/list_card_widget.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);
    print('CART LENGTH is ${cartProvider.cartItems.length}');
    return Scaffold(
      appBar: CommonWidgets.appbar(),
      body: cartProvider.cartItems != null &&
          cartProvider.cartItems.length > 0
          ? ListView.builder(
          itemCount: cartProvider.cartItems.length,
          itemBuilder: (context, index) {
            var cart = cartProvider.cartItems[index];
            return GestureDetector(
              onTap: () => _navigateProductPage(cart.product, context),
              child: CartListCard(
                cart: cart,
              ),
            );
          })
          : Center(
        child: Container(
          child: Text('Empty'),
        ),
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
