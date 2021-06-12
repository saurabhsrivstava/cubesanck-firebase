import 'package:cubesnack/CommonViews/AppGroupCheckbox.dart';
import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Constants/AppEnums.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';

class CartPaymentMethod extends StatefulWidget {
  const CartPaymentMethod({Key key}) : super(key: key);

  @override
  _CartPaymentMethodState createState() => _CartPaymentMethodState();
}

class _CartPaymentMethodState extends State<CartPaymentMethod> {
  final options = ["Credit/Debit", "Net Banking", "Wallet", "Cash On Delivery"];
  int selceteIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTitle(
                title: "Payment Method",
                fontSize: AppFont.title3,
                fontWeight: AppFont.bold,
              ),
              AppGroupCheckbox(
                top: 0,
                data: options,
                title: "",
                type: GroupCheckType.vertcle,
                valueCallBack: (v, i) {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
