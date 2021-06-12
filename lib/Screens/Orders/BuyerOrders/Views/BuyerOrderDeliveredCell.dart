import 'package:cubesnack/CommonViews/AppRoundButton.dart';
import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/CommonViews/AppWebView.dart';
import 'package:cubesnack/Screens/Orders/BuyerOrders/ReturnOrder/Page/BuyerCreateReturnPage.dart';
import 'package:cubesnack/Screens/Orders/Models/MOrderResponse.dart';
import 'package:cubesnack/Screens/Orders/SellerOrders/ManageOrder/Views/ManageOrderCell.dart';
import 'package:cubesnack/Screens/Products/Models/Products.dart';
import 'package:cubesnack/Screens/Reviews/Pages/WriteReviewPage.dart';

import 'package:cubesnack/Utils/AppDate.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';

class BuyerOrderDeliveredCell extends StatelessWidget {
  final Products product;
  final String date;
  final MOrder order;
  const BuyerOrderDeliveredCell({Key key, this.product, this.date, this.order})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderDate = AppDate.dateFormate(date);
    return Container(
      child: Card(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductImage(
                  url: product.image.image,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AppTitle(title: product.title),
                    SizedBox(
                      height: 5,
                    ),
                    AppTitle(title: "Order On $orderDate"),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        AppTitle(
                          title: "\$${product.sellingPrice}",
                          fontWeight: AppFont.bold,
                          fontSize: 20,
                        ),
                        Container()
                      ],
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            AppRoundButton(
              title: "buyAgain",
              isRightIcon: false,
              width: MediaQuery.of(context).size.width * 0.95,
              height: 40,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Opacity(
                  opacity: product.isReturnAccepted != null &&
                          product.isReturnAccepted
                      ? 1
                      : 0.4,
                  child: AppRoundButton(
                      title: "Request Return",
                      onPressed: () {
                        if (product.isReturnAccepted != null &&
                            !product.isReturnAccepted) {
                          return;
                        }
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BuyerCreateReturnPage(
                                      product: product,
                                      order: order,
                                    )));
                      },
                      isRightIcon: false,
                      isLocalised: false,
                      fontSize: 10,
                      backgroundColor: Colors.white,
                      borderColor: AppColors.greyBorder,
                      isBorder: true,
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.45,
                      titleColor: Colors.black),
                )),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: AppRoundButton(
                    fontSize: 10,
                    title: "Write a Product Review",
                    isRightIcon: false,
                    isLocalised: false,
                    backgroundColor: Colors.white,
                    borderColor: AppColors.greyBorder,
                    isBorder: true,
                    titleColor: Colors.black,
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.45,
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) => WriteReviewPage(
                                productId: product.id,
                              ));
                      //Navigator.pushNamed(context, AppRoutes.productReview);
                    },
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            if (product.trackingUrl != null)
              InkWell(
                child: Row(
                  children: [
                    AppTitle(title: "track order"),
                    Icon(Icons.art_track)
                  ],
                ),
                onTap: () {
                  AppBrowser.load(product.trackingUrl);
                },
              )
          ],
        ),
      )),
    );
  }
}
