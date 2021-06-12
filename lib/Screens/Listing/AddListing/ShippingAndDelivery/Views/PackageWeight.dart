import 'package:cubesnack/CommonViews/AppTitleTextField.dart';
import 'package:cubesnack/Screens/Listing/AddListing/Models/MShipping.dart';
import 'package:flutter/material.dart';
import 'package:cubesnack/Constants/AppEnums.dart';

class PackageWeight extends StatelessWidget {
  final MShipping shipping;
  const PackageWeight({Key key, this.shipping}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
              child: AppTitleTextField(
            title: "Per unit weight*",
            onChange: (String v) {
              shipping.perUnitWeight = v.toInt();
            },
            keyBoardType: TextInputType.number,
          )),
          SizedBox(width: 10),
          Expanded(
              child: AppTitleTextField(
            title: "Shipping weight*",
            onChange: (String v) {
              shipping.shippingWeight = v.toInt();
            },
            keyBoardType: TextInputType.number,
          ))
        ],
      ),
    );
  }
}
