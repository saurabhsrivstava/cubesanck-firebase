import 'package:cubesnack/CommonViews/AppTextField.dart';
import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Screens/Listing/AddListing/Models/MShipping.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:cubesnack/Constants/AppEnums.dart';

class PackageDimensions extends StatelessWidget {
  final MShipping shipping;
  const PackageDimensions({Key key, this.shipping}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTitle(
                  title: "Per unit dimesions*",
                  padding: EdgeInsets.only(top: 15, bottom: 5),
                  fontSize: AppFont.title2,
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                          child: AppTextField(
                        hintText: "L",
                        onChange: (String v) {
                          shipping.perUnitDimension.length = v.toInt();
                        },
                        keyBoardType: TextInputType.number,
                      )),
                      SizedBox(width: 10),
                      Expanded(
                          child: AppTextField(
                        hintText: "w",
                        onChange: (String v) {
                          shipping.perUnitDimension.width = v.toInt();
                        },
                        keyBoardType: TextInputType.number,
                      )),
                      SizedBox(width: 10),
                      Expanded(
                          child: AppTextField(
                        hintText: "h",
                        onChange: (String v) {
                          shipping.perUnitDimension.height = v.toInt();
                        },
                        keyBoardType: TextInputType.number,
                      ))
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTitle(
                  title: "Shipping package dimesions*",
                  fontSize: AppFont.title2,
                  padding: EdgeInsets.only(top: 15, bottom: 5),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                          child: AppTextField(
                        hintText: "L",
                        onChange: (String v) {
                          shipping.shippingPackageDimensions.length = v.toInt();
                        },
                        keyBoardType: TextInputType.number,
                      )),
                      SizedBox(width: 10),
                      Expanded(
                          child: AppTextField(
                        hintText: "W",
                        onChange: (String v) {
                          shipping.shippingPackageDimensions.width = v.toInt();
                        },
                        keyBoardType: TextInputType.number,
                      )),
                      SizedBox(width: 10),
                      Expanded(
                          child: AppTextField(
                        hintText: "H",
                        onChange: (String v) {
                          shipping.shippingPackageDimensions.height = v.toInt();
                        },
                        keyBoardType: TextInputType.number,
                      ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
