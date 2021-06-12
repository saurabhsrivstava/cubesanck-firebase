import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Screens/Products/Models/Products.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SellerInfo extends StatelessWidget {
  final Products product;

  const SellerInfo({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppTitle(
              title: "Sold by: ${product.brandManufacturer}",
              color: AppColors.grey500,
              fontSize: AppFont.title2,
              fontWeight: AppFont.medium,
              padding: EdgeInsets.only(bottom: 10),
            ),
            AppTitle(
              title: "Visit ${product.brandManufacturer} Store",
              fontWeight: AppFont.medium,
              fontSize: AppFont.title2,
              color: AppColors.darkBlue,
            ),
          ],
        ),
        Spacer(),
        if (_getTitle().length > 0)
          Row(
            children: [
              SvgPicture.asset("Assets/images/location_icon.svg"),
              AppTitle(
                title: _getTitle(),
                color: Colors.black,
                fontSize: AppFont.title1,
              ),
            ],
          )
      ],
    );
  }

  _getTitle() {
    if (product.isStorePickup && product.isSameDayDelivery) {
      return "In-Store Pick Up & Same-Day Delivery";
    } else if (product.isStorePickup) {
      return "In-Store Pick Up";
    } else if (product.isSameDayDelivery) {
      return "Same-Day Delivery";
    } else {
      return "";
    }
  }
}
