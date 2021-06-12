import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Screens/Products/Models/Products.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';

class ProductInfoCell extends StatelessWidget {
  final Products product;
  const ProductInfoCell({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTitle(
            title: product.title,
            maxLines: 2,
            padding: EdgeInsets.only(bottom: 5),
            fontSize: AppFont.title2,
            textAlign: TextAlign.start,
          ),
          _priceRow()
        ],
      ),
    );
  }

  _priceRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppTitle(
          title: "\$ ${product.discountedPrice}",
          fontWeight: FontWeight.w600,
          fontSize: AppFont.title2,
        ),
        AppTitle(
          title: "\$ ${product.price}",
          fontSize: AppFont.title0,
          decoration: TextDecoration.lineThrough,
        ),
        AppTitle(
          title: "(${product.offerPercenntage}% off)",
          fontSize: AppFont.title0,
        ),
        _ratting()
      ],
    );
  }

  _ratting() {
    return Container(
      alignment: Alignment.center,
      width: 30,
      padding: EdgeInsets.all(2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.star,
            size: 10,
            color: Colors.white,
          ),
          AppTitle(
            title: "${product.rating}",
            color: Colors.white,
            fontSize: AppFont.title1,
          )
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppColors.darkBlue),
    );
  }
}
