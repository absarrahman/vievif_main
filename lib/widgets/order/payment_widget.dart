import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vievif/provider/payment_provider.dart';
import 'package:vievif/utils/colors.dart';
import 'package:vievif/widgets/common_widgets.dart';

class PaymentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var paymentProvider = Provider.of<PaymentProvider>(context);
    return Container(
      child: Column(
        children: [
          CommonWidgets.header('Le paiement'),
          switchPaymentMethod(paymentProvider: paymentProvider),
          paymentProvider.isCardPayment
              ? cardPayment()
              : cashOnDelivery(),
        ],
      ),
    );
  }

  Widget cashOnDelivery() {
    return Container(
      child: Text('Cash on delivery'),
    );
  }

  Widget cardPayment() {
    return Container(
      child: Text('Card payment'),
    );
  }

  Widget switchPaymentMethod({PaymentProvider paymentProvider}) {
    return Switch(
      activeColor: kRedColor,
      value: paymentProvider.isCardPayment,
      onChanged: (changedValue) {
        paymentProvider.setIsCardPayment(changedValue);
      },
    );
  }
}
