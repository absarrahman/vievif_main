import 'package:flutter/material.dart';
import 'package:vievif/models/order_model.dart';
import 'package:vievif/widgets/common_widgets.dart';

class OrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appbar(),
      body: FutureBuilder(
        builder: (context,AsyncSnapshot<OrderModel>snapshot){
          return Container();
        },
      ),
    );
  }
}
