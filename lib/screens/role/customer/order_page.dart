import 'package:flutter/material.dart';
import 'package:vievif/models/order_model.dart';
import 'package:vievif/widgets/common_widgets.dart';

class OrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appbar(),
      body: FutureBuilder(
        builder: (context,AsyncSnapshot<List<OrderModel>>snapshot){
          if(snapshot.hasData) {
            //TODO show list of orders
            return Container();
          } else if (snapshot.connectionState == ConnectionState.waiting){
            return CommonWidgets.loading();
          }
          return Container();
        },
      ),
    );
  }
}
