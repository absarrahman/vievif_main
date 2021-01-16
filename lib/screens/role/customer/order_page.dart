import 'package:flutter/material.dart';
import 'package:vievif/widgets/common_widgets.dart';

class OrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appbar(),
      body: FutureBuilder(
        builder: (context,snapshot){
          return Container();
        },
      ),
    );
  }
}
