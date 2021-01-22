import 'package:flutter/material.dart';
import 'package:vievif/models/cart_model.dart';
import 'package:vievif/models/product_model.dart';
import 'package:vievif/widgets/common_widgets.dart';

class ProductListCard extends StatelessWidget {
  final ProductModel product;

  ProductListCard({this.product});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;

    return Material(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          width: size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: size.width / 2,
                  width: size.width - 30,
                  child: Image.network(
                    'https:${product.images[0].src}',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CommonWidgets.vendorPanel(product),
                            CommonWidgets.onSale(product),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Text(
                                product.name,
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  CommonWidgets.numberFormatter(product.price),
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CartListCard extends StatelessWidget {
  final CartModel cart;

  CartListCard({this.cart});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    print('Width ${size.width}');
    return Material(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          width: size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: size.width / 2,
                  width: size.width - 30,
                  child: Image.network(
                    'https:${cart.variation.image.src}',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CommonWidgets.vendorPanel(cart.product),
                            CommonWidgets.onSale(cart.product),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Text(
                                cart.product.name,
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            Flexible(
                              child: Visibility(
                                visible: cart.variation != null,
                                child: cart.isAttribute1
                                    ? Text(
                                  '${cart.variation.attributes[0].name} ${cart
                                      .variation.attributes[0].option}\n'
                                      '${cart.isAttribute2 ? cart.variation
                                      .attributes[1].name : ''} ${cart
                                      .isAttribute2 ? cart.variation
                                      .attributes[1].option : ''}', style:TextStyle(
                                  fontSize: 20
                                ),)
                                    : Container(),
                              ),
                            ),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  CommonWidgets.numberFormatter(
                                      cart.price.toString()),
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Quantité ${cart.quantity}',style: TextStyle(
                              fontSize: 15
                            ),),
                            Text('VAT 20%',style: TextStyle(
                                fontSize: 15
                            ),),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text('Total ${CommonWidgets.numberFormatter((cart.price + (cart.price * 0.2)).toString())}',style: TextStyle(
                              fontSize: 15
                          ),
                            textAlign: TextAlign.center,),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
