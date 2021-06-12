import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Screens/Orders/BuyerOrders/Views/BuyerOrderDeliveredCell.dart';
import 'package:cubesnack/Screens/Orders/BuyerOrders/Views/BuyerPaymentMethodCell.dart';
import 'package:cubesnack/Screens/Orders/CommonViews/OrderTotalView.dart';
import 'package:cubesnack/Screens/Orders/Models/MOrderResponse.dart';
import 'package:cubesnack/Tabbar/Home/Models/MHomeProductList.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';

class BuyerOrderDetailsList extends StatelessWidget {
  final MOrder order;

  const BuyerOrderDetailsList({Key key, this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ..._createProducts(),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTitle(
                    title: "Order Details",
                    fontSize: AppFont.title5,
                    fontWeight: AppFont.bold,
                  ),
                  Divider(),
                  OrderTotalView(
                    order: order,
                  ),
                ],
              ),
            ),
          ),
          BuyerPaymentMethodCell(
            order: order,
          )
        ],
      ),
    ));
  }

  _createProducts() {
    return order.items
        .map((product) => BuyerOrderDeliveredCell(
              product: product,
              date: order.createdAt,
              order: order,
            ))
        .toList();
  }
}
