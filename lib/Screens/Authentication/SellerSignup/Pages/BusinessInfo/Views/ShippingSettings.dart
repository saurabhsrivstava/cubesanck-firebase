import 'package:cubesnack/CommonViews/AppGroupCheckbox.dart';
import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Pages/BusinessInfo/Models/BusinessInfo.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';

class ShippingSettings extends StatelessWidget {
  final ShippingSetting setting;
  const ShippingSettings({Key key, this.setting}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AppTitle(
            title: "Shipping Settings",
            fontWeight: AppFont.bold,
            fontSize: AppFont.title4,
          ),
          AppGroupCheckbox(
            data: ["Yes", "No"],
            title: "Do you offer free returns?",
            valueCallBack: (v, i) {
              setting.isFreeReturn = v == "No" ? false : true;
            },
          ),
          AppGroupCheckbox(
            data: ["Yes", "No"],
            title: "Do you offer free shipping?",
            valueCallBack: (v, i) {
              setting.isFreeShipping = v == "No" ? false : true;
              ;
            },
          )
        ],
      ),
    );
  }
}
