import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Screens/Products/Models/Products.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';

class ProductAdditiionalInfo extends StatelessWidget {
  final Products product;
  const ProductAdditiionalInfo({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTitle(
            title: "Product Additional Information",
            padding: EdgeInsets.only(top: 15, bottom: 5),
            fontSize: 14,
            fontWeight: AppFont.bold,
          ),
          ...product.additionalInfo
              .map((e) => Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.check_box_outline_blank,
                        color: AppColors.grey500,
                        size: 15,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Flexible(
                        child: AppTitle(
                          title: e,
                          maxLines: 5,
                          textAlign: TextAlign.left,
                          padding: EdgeInsets.only(bottom: 5),
                        ),
                      ),
                    ],
                  ))
              .toList()
        ],
      ),
    );
  }
}
