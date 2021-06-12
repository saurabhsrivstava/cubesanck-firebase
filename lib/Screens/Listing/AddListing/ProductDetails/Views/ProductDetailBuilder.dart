import 'package:cubesnack/CommonViews/AppGroupCheckbox.dart';
import 'package:cubesnack/CommonViews/AppRoundButton.dart';
import 'package:cubesnack/CommonViews/AppTextView.dart';
import 'package:cubesnack/CommonViews/AppTitleTextField.dart';
import 'package:cubesnack/CommonViews/BrowseFilePreview.dart';
import 'package:cubesnack/Constants/AppEnums.dart';
import 'package:cubesnack/Screens/Listing/AddListing/Models/MCategoryData.dart';
import 'package:cubesnack/Screens/Listing/AddListing/Models/MProductDetail.dart';
import 'package:cubesnack/Screens/Listing/AddListing/ProductDetails/Views/CategoryRow.dart';
import 'package:cubesnack/Screens/Listing/AddListing/TNC/Views/ReturnConditions.dart';
import 'package:cubesnack/Utils/Util.dart';
import 'package:flutter/material.dart';
import 'ProductIdRow.dart';
import 'StoreSearchList.dart';

class ProductDetailBuilder extends StatelessWidget {
  final MProductDetail product;
  final Function callBack;
  final MCategoryResponse categories;

  const ProductDetailBuilder(
      {Key key, this.product, this.callBack, this.categories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StoreSearchList(
            selectedStoreCallBack: (v) {
              product.stores = v.toList();
              appPrint(product.stores);
            },
          ),
          if (categories != null)
            CategoryRow(
              categories: categories,
              product: product,
            ),
          AppTitleTextField(
            marginTop: 20,
            title: "Product title",
            subTitle: "(upto 200 charectors)",
            onChange: (v) {
              product.title = v;
            },
          ),
          AppTitleTextField(
            marginTop: 20,
            title: "Brand/Manufacturer",
            onChange: (v) {
              product.brandManufacturer = v;
            },
          ),
          ProductIdRow(
            product: product,
          ),
          AppTitleTextField(
            marginTop: 20,
            title: "Units in stocks*",
            onChange: (String v) {
              product.unitsInStoc = v.toInt();
            },
            keyBoardType: TextInputType.number,
          ),
          AppTextView(
            top: 20,
            title: "Descrption",
            subTitle: "(3000 charectors)*",
            onChange: (String v) {
              product.description = v;
            },
            hintText: "Product Description",
          ),
          ReturnConditions(
            points: product.bulletPoints,
          ),
          BrowseFilePreview(
            valueCallBack: (v) {
              product.images.add(v);
            },
          ),
          AppGroupCheckbox(
            data: ["Active", "Deactive"],
            title: "Select store status",
            valueCallBack: (v, i) {
              product.isActive = v == "Active" ? true : false;
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppRoundButton(
                  margin: 30,
                  width: 180,
                  title: "continue",
                  onPressed: () => this.callBack(context)),
            ],
          )
        ],
      ),
    );
  }
}
