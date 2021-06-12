import 'package:cubesnack/Screens/Products/Models/Products.dart';
import 'package:flutter/material.dart';

import 'BrowingHistoryCell.dart';

class BrowsingHistoryBuilder extends StatelessWidget {
  final List<Products> products;
  const BrowsingHistoryBuilder({Key key, this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (context, index) {
          final product = products[index];
          return BrowingHistoryCell(
            product: product,
          );
        },
        itemCount: products?.length ?? 0,
      ),
    );
  }
}
