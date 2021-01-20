import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';
import 'package:vievif/utils/colors.dart';
import 'package:vievif/widgets/common_widgets.dart';
import 'package:vievif/widgets/order/confirm_order_widget.dart';
import 'package:vievif/widgets/order/house_address_widget.dart';
import 'package:vievif/widgets/order/payment_widget.dart';

class OrderConfirmationPage extends StatefulWidget {
  @override
  _IconStepperDemo createState() => _IconStepperDemo();
}

class _IconStepperDemo extends State<OrderConfirmationPage> {
  int activeStep = 0;

  int upperBound = 3;

  List<Widget> _widgets = [
    AddressWidget(),
    PaymentWidget(),
    ConfirmOrderWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appbar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            IconStepper(
              lineColor: kRedColor,
              stepColor: kRedColor,
              activeStepColor: kYellowish,
              icons: [
                Icon(Icons.house),
                Icon(Icons.payment),
                Icon(Icons.local_shipping),
              ],

              activeStep: activeStep,

              upperBound: (bound) => upperBound = bound,
              enableStepTapping: false,

              onStepReached: (index) {
                setState(() {
                  activeStep = index;
                });
              },
            ),
            Expanded(
              child: Center(
                child: _widgets[activeStep],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  previousButton(),
                  Visibility(
                    visible: activeStep< upperBound,
                      child: nextButton()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget nextButton() {
    return RaisedButton(
      color: kYellowish,
      splashColor: kRedColor,
      shape: StadiumBorder(),
      onPressed: () {
        if (activeStep < upperBound) {
          setState(() {
            activeStep++;
          });
        }
      },
      child: Text('Suivante'),
    );
  }

  Widget previousButton() {
    return RaisedButton(
      color: kYellowish,
      splashColor: kRedColor,
      shape: StadiumBorder(),
      onPressed: () {
        if (activeStep > 0) {
          setState(() {
            activeStep--;
          });
        }
      },
      child: Text('Précédent'),
    );
  }
}
