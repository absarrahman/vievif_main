import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vievif/models/order_model.dart';
import 'package:vievif/provider/user_provider.dart';
import 'package:vievif/screens/order/order_details_page.dart';
import 'package:vievif/services/api_service.dart';
import 'package:vievif/services/config.dart';
import 'package:vievif/widgets/common_widgets.dart';
import 'package:vievif/widgets/order/order_list_card.dart';

class OrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context,listen: false);
    return Scaffold(
      appBar: CommonWidgets.appbar(),
      body: FutureBuilder(
        future: userProvider.user.role == UserType.customer ? ApiService().getOrdersOfUser(user: userProvider.user) : ApiService().getOrdersOfUser(),
        builder: (context,AsyncSnapshot<List<OrderModel>>snapshot){
          if(snapshot.hasData) {
            //TODO show list of orders
            return ListView.builder(itemBuilder: (context, index) {
              var order = snapshot.data[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => OrderDetailsPage(id: order.orderId,user: userProvider.user,)));
                },
                  child: OrderListCard(order: order,),);
            },
            itemCount: snapshot.data.length,);
          } else if (snapshot.connectionState == ConnectionState.waiting){
            return CommonWidgets.loading();
          }
          return Center(
            child: Container(
              child: Text('Aucune commande'),
            ),
          );
        },
      ),
    );
  }
}
