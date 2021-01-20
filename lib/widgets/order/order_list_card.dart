import 'package:flutter/material.dart';
import 'package:vievif/models/order_model.dart';
import 'package:vievif/services/config.dart';
import 'package:vievif/utils/colors.dart';

import '../common_widgets.dart';

class OrderListCard extends StatelessWidget {
  final OrderModel order;

  OrderListCard({this.order});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5,
        child: Container(
          width: size.width - 130,
          decoration: BoxDecoration(
            color: kYellowish,
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20,8,20,2),
                child: Container(
                  height: size.width / 3,
                  width: size.width - 30,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'État',
                            ),
                            Text(
                              _statusType(order.status),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Order ID',
                            ),
                            Text(
                              '${order.orderId}',
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Sous-total des articles',
                            ),
                            Text(CommonWidgets.numberFormatter((double.parse(order.total) - double.parse(order.shippingTotal)).toString())),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Expédition',
                            ),
                            Text(CommonWidgets.numberFormatter(order.shippingTotal)),
                          ],
                        ),
                      ),
                    ],
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
                        Center(
                          child: Text(
                            'Total de la commande: ${CommonWidgets.numberFormatter(order.total)}',
                            style: TextStyle(fontSize: 15),
                            textAlign: TextAlign.center,
                          ),
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

  String _statusType(String value) {
    switch (value) {
      case OrderType.cancelled:
        return 'Annulée';
        break;
      case OrderType.completed:
        return 'Terminee';
        break;
      case OrderType.pending:
        return 'Attente paiement';
        break;
      case OrderType.processing:
        return 'En cours';
        break;
      case OrderType.failed:
        return 'Echouée';
        break;
      default:
        return '';
        break;
    }
  }
}
