import 'package:cubesnack/Screens/Orders/Models/MOrderResponse.dart';
import 'package:flutter/material.dart';

import 'ManageOrderCell.dart';

class ManageSellerOrderBuilder extends StatelessWidget {
  final List<MOrder> items;
  final bool isSellerPayouts;
  const ManageSellerOrderBuilder({Key key, this.items, this.isSellerPayouts})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (context, index) {
          final order = items[index];
          return ManageSellerOrderCell(
            order: order,
          );
        },
        itemCount: items?.length ?? 0,
      ),
    );
  }
}
