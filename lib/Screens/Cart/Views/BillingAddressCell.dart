import 'package:cubesnack/CommonViews/AppTextField.dart';
import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Views/SellerAddress.dart';
import 'package:cubesnack/Screens/Cart/Models/MUserCartResponse.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';

class BillingAddressCell extends StatelessWidget {
  final UserBillingAddress billingAddress;
  const BillingAddressCell({Key key, this.billingAddress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTitle(
            title: "Billing Address",
            fontSize: AppFont.title3,
            fontWeight: AppFont.bold,
            padding: EdgeInsets.only(bottom: 10),
          ),
          AppTextField(
            hintText: "Name",
            onChange: (v) {
              this.billingAddress.name = v;
            },
          ),
          SellerAddress(
            address: this.billingAddress.address,
          ),
        ],
      ),
    );
  }
}
