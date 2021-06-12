import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Screens/Products/Models/Products.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductShippingInfoCell extends StatelessWidget {
  final Products product;
  const ProductShippingInfoCell({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTitle(
            title: "This item is eligible for:",
            fontSize: AppFont.title1,
            padding: EdgeInsets.only(bottom: 20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Opacity(
                opacity: product.isFreeShipping ? 1 : 0.3,
                child: _item(title: "Shipping", icon: "shipping"),
              ),
              Opacity(
                opacity: product.isStorePickup ? 1 : 0.3,
                child: _item(title: "In-store pickup", icon: "instorePickup"),
              ),
              Opacity(
                  opacity: product.isSameDayDelivery ? 1 : 0.3,
                  child: _item(title: "Delivery", icon: "homeDelivery"))
            ],
          ),
        ],
      ),
    );
  }

  _item({String title, String icon}) {
    return Column(
      children: [
        SvgPicture.asset(
          "assets/home/$icon.svg",
          height: 15,
          width: 15,
        ),
        AppTitle(
          title: title,
          fontSize: AppFont.title0,
        )
      ],
    );
  }
}
