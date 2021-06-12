import 'package:cubesnack/Screens/Orders/BuyerOrders/Views/BuyerOrderListCell.dart';
import 'package:cubesnack/Screens/Orders/Models/MOrderResponse.dart';
import 'package:flutter/material.dart';

class BuyerOrderListBuilder extends StatelessWidget {
  final List<MOrder> items;
  const BuyerOrderListBuilder({Key key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (context, index) {
          final MOrder order = items[index];
          return BuyerOrderListCell(
            order: order,
          );
        },
        itemCount: items != null && items.length > 0 ? items.length : 0,
      ),
    );
  }
}
