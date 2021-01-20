import 'package:flutter/material.dart';
import 'package:vievif/models/order_model.dart';
import 'package:vievif/models/user_model.dart';
import 'package:vievif/services/api_service.dart';
import 'package:vievif/widgets/common_widgets.dart';

class OrderDetailsPage extends StatefulWidget {
  final UserModel user;
  final int id;

  OrderDetailsPage({this.user, this.id});

  @override
  _OrderDetailsPageState createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appbar(),
      body: FutureBuilder(
        future: ApiService().getSpecificOrder(user: widget.user, id: widget.id),
        builder: (context, AsyncSnapshot<OrderModel> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CommonWidgets.loading();
          } else if (snapshot.hasData) {
            return _layout(snapshot.data);
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget _layout(OrderModel order) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Numéro de commande \n${order.orderId}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Statut de la commande \n${order.status}',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Liste des projets',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          Flexible(
            child: ListView.builder(
                itemCount: order.lineItems.length,
                itemBuilder: (context, index) {
                  var item = order.lineItems[index];
                  return cardItem(item);
                }),
          )
        ],
      ),
    );
  }

  Widget cardItem(LineItem item) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  item.name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'ID produit',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      '${item.productId}',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Quantité',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      '${item.quantity}',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Montant total',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      '${CommonWidgets.numberFormatter(item.total)}',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
