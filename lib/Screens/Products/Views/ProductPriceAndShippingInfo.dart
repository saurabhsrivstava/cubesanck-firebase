import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/CommonViews/MultiTitle.dart';
import 'package:cubesnack/Screens/Products/Models/Products.dart';
import 'package:cubesnack/Screens/Products/Views/ShippingInfoRow.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';

class ProductPriceAndShippingInfo extends StatelessWidget {
  final Products product;
  final Variants selected;

  const ProductPriceAndShippingInfo({Key key, this.product, this.selected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                MultiTitle(
                  title: AppTitle(
                    title: "List Price",
                    fontSize: AppFont.title1,
                  ),
                  subTitle: AppTitle(
                    title: selected != null
                        ? " \$ ${selected.regularPrice}"
                        : " \$ ${product.price}",
                    color: AppColors.grey500,
                    fontSize: 10,
                  ),
                  bottom: 5,
                ),
                MultiTitle(
                  title: AppTitle(
                    title: "Sale Price",
                    fontSize: AppFont.title1,
                  ),
                  subTitle: AppTitle(
                    title: selected != null
                        ? " \$ ${selected.salePrice}"
                        : " \$ ${product.sellingPrice}",
                    color: AppColors.grey500,
                    fontSize: 10,
                  ),
                  bottom: 5,
                ),
                MultiTitle(
                  title: AppTitle(
                    title: "Savings",
                    fontSize: AppFont.title1,
                  ),
                  subTitle: AppTitle(
                    title: _getOfferPrice(),
                    color: AppColors.grey500,
                    fontSize: 10,
                  ),
                  bottom: 5,
                )
              ],
            ),
          ),
          ShippingInfoRow(
            product: product,
          )
        ],
      ),
    );
  }

  _getOfferPrice() {
    return selected != null
        ? " \$${selected.regularPrice - selected.salePrice}(${selected.disCountPercentage}%)"
        : " \$${product.price - product.sellingPrice}(${product.discountedPrice}%)";
  }
}
