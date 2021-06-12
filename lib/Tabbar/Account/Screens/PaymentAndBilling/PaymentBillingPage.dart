import 'package:cubesnack/Tabbar/Account/Screens/PaymentAndBilling/Views/PaymentBillingBuilder.dart';
import 'package:flutter/material.dart';

class PaymentBillingPage extends StatelessWidget {
  const PaymentBillingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PaymentBillingBuilder(),
    );
  }
}
