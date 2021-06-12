import 'package:cubesnack/CommonViews/AppGroupCheckbox.dart';
import 'package:cubesnack/CommonViews/AppRoundButton.dart';
import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Screens/Listing/AddListing/Models/MShipping.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';

import 'PackageDimensions.dart';
import 'PackageWeight.dart';
import 'PrimaryAddress.dart';
import 'ReturnAddress.dart';

class ShippingAndDeliveryBuilder extends StatelessWidget {
  final MShipping shipping;
  final Function continuePress;
  const ShippingAndDeliveryBuilder({Key key, this.shipping, this.continuePress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppTitle(
                title: "Default Shipping information",
                fontWeight: FontWeight.w600,
                padding: EdgeInsets.only(top: 15, bottom: 15),
                fontSize: AppFont.title4,
              ),
            ],
          ),
          PackageWeight(
            shipping: shipping,
          ),
          PackageDimensions(
            shipping: shipping,
          ),
          PrimaryAddress(
            shipping: shipping,
          ),
          ReturnAddress(
            shipping: shipping,
          ),
          AppGroupCheckbox(
            data: ["Yes", "No"],
            title: "Do you offer same day delivery",
            valueCallBack: (v, i) {
              shipping.sameDayHomeDelivery = v == "Yes" ? true : false;
            },
          ),
          AppRoundButton(
              margin: 30,
              width: 180,
              title: "continue",
              onPressed: () => continuePress(context))
        ],
      ),
    );
  }
}
