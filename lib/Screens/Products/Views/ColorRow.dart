import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Screens/Orders/SellerOrders/ManageOrder/Views/ManageOrderCell.dart';
import 'package:cubesnack/Screens/Products/Models/Products.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorRow extends StatelessWidget {
  final List<Variants> variants;
  final Function callBack;
  final Variants selected;

  const ColorRow({Key key, this.variants, this.callBack, this.selected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTitle(
            title: "Color",
            color: AppColors.grey700,
            fontSize: AppFont.title3,
            fontWeight: AppFont.medium,
            padding: EdgeInsets.only(bottom: 10),
          ),
          Row(children: [...variants.map((e) => _colorImage(e)).toList()])
        ],
      ),
    );
  }

  _colorImage(Variants e) {
    return InkWell(
      onTap: () => this.callBack(e),
      child: Column(
        children: [
          ProductImage(
            url: e.image,
            isSelected: e.id == selected.id ? true : false,
          ),
          AppTitle(
            title: e.variantOptions.first,
            color: AppColors.grey600,
            fontSize: AppFont.title1,
            fontWeight: AppFont.medium,
            padding: EdgeInsets.only(top: 5),
          )
        ],
      ),
    );
  }
}
