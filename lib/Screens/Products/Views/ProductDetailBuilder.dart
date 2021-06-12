import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Screens/Products/Models/Products.dart';
import 'package:cubesnack/Screens/Products/Views/AdditionalDetails.dart';
import 'package:cubesnack/Screens/Products/Views/DeliveryOptions.dart';
import 'package:cubesnack/Screens/Products/Views/ImproveThisPage.dart';
import 'package:cubesnack/Screens/Products/Views/MessageReportMore.dart';
import 'package:cubesnack/Screens/Products/Views/ProductAdditiionalInfo.dart';
import 'package:cubesnack/Screens/Products/Views/ProductColorAndSizeInfo.dart';
import 'package:cubesnack/Screens/Products/Views/ProductDescription.dart';
import 'package:cubesnack/Screens/Products/Views/ProductImageSider.dart';
import 'package:cubesnack/Screens/Products/Views/ProductNameAndReviewsInfo.dart';
import 'package:cubesnack/Screens/Products/Views/ProductReview.dart';
import 'package:cubesnack/Screens/Products/Views/ProductReviewList.dart';
import 'package:cubesnack/Screens/Products/Views/ReturnExchangeCondition.dart';
import 'package:cubesnack/Screens/Products/Views/SellerInfo.dart';
import 'package:cubesnack/Screens/Products/Views/StorePolicy.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';

class ProductDetailBuilder extends StatelessWidget {
  final Products product;

  const ProductDetailBuilder({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: EdgeInsets.only(left: size.height / 5, right: size.height / 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTitle(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            title: "Home/ Fashion/ Shoes",
            maxLines: 3,
            fontWeight: AppFont.medium,
            fontSize: AppFont.title4,
            textAlign: TextAlign.left,
          ),
          Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
            child: Flex(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              direction: Axis.horizontal,
              children: [
                Expanded(
                  child: Card(
                    margin: EdgeInsets.all(10),
                    child: ProductImageSider(
                      images: product.images,
                      product: product,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        ProductNameAndReviewsInfo(
                          product: product,
                        ),
                        Divider(),
                        Container(
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          child: SellerInfo(
                            product: product,
                          ),
                        ),
                        Divider(),
                        ProductColorAndSizeInfo(
                          product: product,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          DeliveryOptions(
            direction: Axis.horizontal,
          ),
          ImproveThisPage(),
          Divider(),
          ProductAdditiionalInfo(
            product: product,
          ),
          ProductDescription(
            product: product,
          ),
          AdditionalDetails(),
          Divider(),
          StorePolicy(),
          ReturnExchangeCondition(),
          MessageReportMore(),
          Divider(),
          if (product.reviews != null && product.reviews.length > 0)
            Column(
              children: [
                ProductReview(product: product),
                ProductReviewList(
                  reviews: product.reviews,
                )
              ],
            )
          else
            Container()
        ],
      ),
    );
  }
}
