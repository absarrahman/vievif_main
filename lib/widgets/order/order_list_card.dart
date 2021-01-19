import 'package:flutter/material.dart';
import 'package:vievif/models/order_model.dart';

import '../common_widgets.dart';

class OrderListCard extends StatelessWidget {
  final OrderModel order;

  OrderListCard({this.order});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;

    return Material(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          width: size.width - 130,
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
                  child: Text(
                    order.status,
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
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Text(
                                order.orderId.toString(),
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  CommonWidgets.numberFormatter(
                                      order.total.toString()),
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
                            Text('Quantité ${order.shipping.phone}',style: TextStyle(
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
                          child: Text('Total ${CommonWidgets.numberFormatter(order.total)}',style: TextStyle(
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