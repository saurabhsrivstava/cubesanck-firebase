import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Screens/Orders/CommonViews/OrderTotalView.dart';
import 'package:cubesnack/Screens/Orders/Models/MOrderResponse.dart';
import 'package:cubesnack/Screens/Orders/SellerOrders/OrderDetails/Views/SellerItemInfo.dart';
import 'package:cubesnack/Screens/Orders/SellerOrders/OrderDetails/Views/SellerOrderInfo.dart';
import 'package:flutter/material.dart';

class SellerOrderDetailBuilder extends StatelessWidget {
  final MOrder order;
  const SellerOrderDetailBuilder({Key key, this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SellerOrderInfo(
              order: order,
            ),
            ...order.items
                .map((e) => SellerItemInfo(
                      product: e,
                      order: order,
                    ))
                .toList(),
            OrderTotalView(
              order: order,
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
