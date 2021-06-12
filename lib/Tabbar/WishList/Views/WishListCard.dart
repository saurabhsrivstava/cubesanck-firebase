import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Screens/Orders/SellerOrders/ManageOrder/Views/ManageOrderCell.dart';
import 'package:cubesnack/Screens/Products/Models/Products.dart';
import 'package:cubesnack/Tabbar/Home/Views/ProductInfoCell.dart';
import 'package:cubesnack/Tabbar/Home/Views/ProductShippingInfoCell.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';

class WishListCard extends StatelessWidget {
  final Products item;
  const WishListCard({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.all(10),
      child: Container(
        margin: EdgeInsets.all(10),
        child: Row(
          children: [
            ProductImage(
              url: item.image.image,
            ),
            SizedBox(width: 20),
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductInfoCell(
                      product: item,
                    ),
                    Divider(),
                    Container(
                      padding: EdgeInsets.only(top: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppTitle(
                            title: "eligibleFor",
                            fontSize: AppFont.title0,
                            isLocalised: true,
                            padding: EdgeInsets.only(bottom: 5),
                          ),
                          ProductShippingInfoCell(
                            product: item,
                          ),
                        ],
                      ),
                      width: 150,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
