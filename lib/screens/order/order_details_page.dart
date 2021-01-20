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
          Text('Your items '),
          Flexible(
            child: ListView.builder(
              itemCount: order.lineItems.length,
                itemBuilder: (context,index) {
              var item = order.lineItems[index];
              return Text(item.name.toString());
            }),
          )
        ],
      ),
    );
  }
}
