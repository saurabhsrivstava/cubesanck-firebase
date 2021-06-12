import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Screens/Products/Models/Products.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';

class ProductDescription extends StatelessWidget {
  final Products product;

  const ProductDescription({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTitle(
            title: "Product Description",
            padding: EdgeInsets.only(top: 15),
            fontSize: 14,
            fontWeight: AppFont.bold,
          ),
          AppTitle(
            title: product.description,
            maxLines: 15,
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
