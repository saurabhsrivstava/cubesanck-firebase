import 'package:cubesnack/CommonViews/AppRoundButton.dart';
import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/CommonViews/MultiTitle.dart';
import 'package:cubesnack/CommonViews/Navbar.dart';
import 'package:cubesnack/Screens/Orders/BuyerOrders/Pages/BuyerOrderDetailsPage.dart';
import 'package:cubesnack/Screens/Orders/Models/MOrderResponse.dart';
import 'package:cubesnack/Screens/Orders/SellerOrders/ManageOrder/Views/ManageOrderCell.dart';
import 'package:cubesnack/Screens/Products/Models/Products.dart';
import 'package:cubesnack/Utils/AppDate.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:cubesnack/Utils/Util.dart';
import 'package:flutter/material.dart';

class BuyerOrderListCell extends StatelessWidget {
  final MOrder order;
  const BuyerOrderListCell({Key key, this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderDate = AppDate.dateFormate(order.createdAt);
    return InkWell(
      onTap: () {
        appPrint("SHowDetails");
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BuyerOrderDetailsPage(
                      order: order,
                    )));
      },
      child: Container(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    AppTitle(
                      title: "Order Id- ${order.orderId.split("-").first}",
                      fontSize: AppFont.title3,
                      fontWeight: AppFont.bold,
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios_sharp)
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: MultiTitle(
                        title: AppTitle(
                          title: "Total Amount:",
                          fontWeight: AppFont.medium,
                          fontSize: AppFont.title1,
                        ),
                        subTitle: AppTitle(
                          title: "\$ ${order.totalAmount}",
                          fontWeight: AppFont.bold,
                          fontSize: AppFont.title1,
                        ),
                      ),
                    ),
                    Expanded(
                      child: AppTitle(
                        title: "Order on- $orderDate",
                        fontSize: AppFont.title1,
                        fontWeight: AppFont.medium,
                        color: AppColors.grey500,
                      ),
                    ),
                    if (order.deliveredDate != null)
                      Expanded(
                        child: AppTitle(
                          title: "Delivered ${order.deliveredDate}",
                          fontSize: AppFont.title1,
                          fontWeight: AppFont.medium,
                          color: AppColors.grey500,
                        ),
                      ),
                  ],
                ),
                Divider(),
                Row(
                  children: [
                    ...order.items.map((e) => _ProductCard(e: e)).toList()
                  ],
                ),
                _Actions()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final Products e;
  const _ProductCard({Key key, this.e}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width - 30) / 4,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ProductImage(
              url: e?.image?.image,
            ),
            Divider(),
            AppTitle(
              title: e.title,
              maxLines: 2,
              fontSize: AppFont.title1,
              fontWeight: AppFont.medium,
              color: AppColors.grey500,
              padding: EdgeInsets.only(bottom: 5),
            )
          ],
        ),
      ),
    );
  }
}

class _Actions extends StatelessWidget {
  final String productId;
  const _Actions({Key key, this.productId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(
        children: [
          AppRoundButton(
            title: "buyItAgain",
            isBorder: true,
            isRightIcon: false,
            backgroundColor: white,
            borderColor: AppColors.greyBorder,
            titleColor: AppColors.darkBlue,
            height: 20,
            fontSize: 10,
          ),
          SizedBox(
            width: 10,
          ),
          // AppRoundButton(
          //   title: "writeAProductReview",
          //   isBorder: true,
          //   isRightIcon: false,
          //   backgroundColor: white,
          //   borderColor: AppColors.greyBorder,
          //   titleColor: AppColors.darkBlue,
          //   height: 20,
          //   fontSize: 10,
          //   onPressed: () {
          //     showModalBottomSheet(
          //         context: context,
          //         builder: (context) => WriteReviewPage(
          //               productId: productId,
          //             ));
          //   },
          // ),
        ],
      ),
    );
  }
}
