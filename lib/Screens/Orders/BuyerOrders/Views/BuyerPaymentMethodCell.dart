import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Screens/Orders/CommonViews/OrderAddress.dart';
import 'package:cubesnack/Screens/Orders/Models/MOrderResponse.dart';
import 'package:cubesnack/Tabbar/Account/Screens/DeliveryAndAddress/Views/AddAddressRow.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:cubesnack/Utils/UserSession.dart';
import 'package:flutter/material.dart';

class BuyerPaymentMethodCell extends StatelessWidget {
  final MOrder order;
  const BuyerPaymentMethodCell({Key key, this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTitle(
                title: "Payment Method",
                fontSize: AppFont.title5,
                fontWeight: AppFont.bold,
              ),
              AppTitle(
                title: order.paymentType,
                fontSize: AppFont.title3,
                fontWeight: AppFont.medium,
              ),
              OrderAddress(
                title: "Shipping Address:",
                line1: order.billingAddress?.address1,
                line2: order.billingAddress.address2 +
                    " " +
                    order.billingAddress?.city +
                    " " +
                    order.billingAddress?.state,
                email: UserSession.shared.email,
                phone: order.billingAddress?.phone,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
