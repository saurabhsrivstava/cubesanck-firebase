import 'package:cubesnack/CommonViews/AppRadioButton.dart';
import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Views/SellerAddress.dart';
import 'package:cubesnack/Screens/Listing/AddListing/Models/MShipping.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';

class ReturnAddress extends StatefulWidget {
  final MShipping shipping;

  const ReturnAddress({Key key, this.shipping}) : super(key: key);

  @override
  _ReturnAddressState createState() => _ReturnAddressState();
}

class _ReturnAddressState extends State<ReturnAddress> {
  bool isSame = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTitle(
            title: "Return Address",
            padding: EdgeInsets.only(top: 15),
            fontSize: AppFont.title3,
          ),
          AppRadioButton(
            title: "Same as shipping address",
            valueCallBack: (v) {
              this.setState(() {
                isSame = v;
                this.widget.shipping.isReturnAddressSame = v;
              });
            },
          ),
          !isSame
              ? Container()
              : SellerAddress(
                  address: this.widget.shipping.returnAddress,
                ),
        ],
      ),
    );
  }
}
