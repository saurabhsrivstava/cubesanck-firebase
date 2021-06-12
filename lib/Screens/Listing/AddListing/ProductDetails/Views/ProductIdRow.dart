import 'package:cubesnack/CommonViews/AppDropdown.dart';
import 'package:cubesnack/CommonViews/AppTextField.dart';
import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/CommonViews/MultiTitle.dart';
import 'package:cubesnack/Screens/Listing/AddListing/Models/MProductDetail.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';

class ProductIdRow extends StatelessWidget {
  final MProductDetail product;
  const ProductIdRow({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      height: 65,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: MultiTitle(
              title: AppTitle(
                title: "Product ID barcode",
                fontSize: AppFont.title2,
              ),
              subTitle: AppTitle(
                title: "(UPC,EAC,GSTIN)",
                fontSize: AppFont.title1,
              ),
              bottom: 5,
            ),
            flex: 1,
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: AppDropdown(
                    defaultValue: "UPC",
                    data: ["UPC", "EAC", "GSTIN"],
                    valueCallBack: (v, index) {
                      product.productCode.type = v;
                    },
                  ),
                  flex: 1,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: AppTextField(
                    onChange: (v) {
                      product.productCode.barcode = v;
                    },
                  ),
                  flex: 3,
                )
              ],
            ),
            flex: 3,
          ),
        ],
      ),
    );
  }
}
