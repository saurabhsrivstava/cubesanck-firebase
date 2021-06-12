import 'package:cubesnack/Screens/Products/Models/Products.dart';
import 'package:cubesnack/Screens/Products/Views/DeliveryOptions.dart';

import 'package:cubesnack/Screens/Products/Views/ProductAdditiionalInfo.dart';
import 'package:cubesnack/Screens/Products/Views/ProductColorAndSizeInfo.dart';
import 'package:cubesnack/Screens/Products/Views/ProductDescription.dart';
import 'package:cubesnack/Screens/Products/Views/ProductImageSider.dart';
import 'package:cubesnack/Screens/Products/Views/ProductNameAndReviewsInfo.dart';

import 'package:cubesnack/Screens/Products/Views/ProductReview.dart';
import 'package:cubesnack/Screens/Products/Views/ProductReviewList.dart';
import 'package:cubesnack/WebBuilder/WebBuilder.dart';
import 'package:flutter/material.dart';

class ProductDescriptionBuilder extends StatelessWidget {
  final Products product;
  const ProductDescriptionBuilder({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: WebBuilder(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (product.images.length > 0)
                ProductImageSider(
                  images: product.images,
                  product: product,
                ),
              ProductNameAndReviewsInfo(
                product: product,
              ),
              Divider(),
              // ProductPriceAndShippingInfo(
              //   product: product,
              // ),
              ProductColorAndSizeInfo(
                product: product,
              ),
              // ProductActions(
              //   product: product,
              // ),
              DeliveryOptions(direction: Axis.vertical,),
              ProductAdditiionalInfo(
                product: product,
              ),
              ProductDescription(
                product: product,
              ),
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
        ),
      ),
    );
  }
}
