import 'package:cubesnack/Screens/Authentication/SellerSignup/Views/SellerAddress.dart';
import 'package:cubesnack/Screens/Listing/AddListing/Models/MShipping.dart';
import 'package:flutter/material.dart';

class PrimaryAddress extends StatelessWidget {
  final MShipping shipping;

  const PrimaryAddress({Key key, this.shipping}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SellerAddress(
        title: "Primary shipping address*",
        address: shipping.primaryShippingAddress,
      ),
    );
  }
}
