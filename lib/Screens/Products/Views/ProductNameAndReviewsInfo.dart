import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/CommonViews/RattingRow.dart';
import 'package:cubesnack/Screens/Products/Models/Products.dart';
import 'package:cubesnack/Screens/Products/Views/LikeShare.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';

class ProductNameAndReviewsInfo extends StatelessWidget {
  final Products product;

  const ProductNameAndReviewsInfo({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTitle(
            title: product.title ?? "",
            maxLines: 3,
            fontWeight: AppFont.medium,
            fontSize: AppFont.title4,
            textAlign: TextAlign.left,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                RattingRow(
                  rattig: product.rating.toDouble(),
                  isCount: false,
                ),
                AppTitle(
                  padding: EdgeInsets.only(left: 5, top: 2),
                  title: "999 Reviews",
                  fontSize: AppFont.title2,
                  fontWeight: AppFont.regular,
                  color: AppColors.grey500,
                ),
                LikeShare(
                  product: product,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
