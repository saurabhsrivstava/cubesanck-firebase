import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Screens/Orders/SellerOrders/ManageOrder/Views/ManageOrderCell.dart';
import 'package:cubesnack/Screens/Products/Models/Products.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';

import 'ProductActions.dart';
import 'ProductPriceAndShippingInfo.dart';

class ProductColorAndSizeInfo extends StatefulWidget {
  final Products product;

  const ProductColorAndSizeInfo({Key key, this.product}) : super(key: key);

  @override
  _ProductColorAndSizeInfoState createState() =>
      _ProductColorAndSizeInfoState();
}

class _ProductColorAndSizeInfoState extends State<ProductColorAndSizeInfo> {
  Variants selected;

  @override
  void initState() {
    selected = widget.product.variants.length > 0
        ? widget.product.variants.first
        : null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        ProductPriceAndShippingInfo(
          selected: selected,
          product: widget.product,
        ),
        _ColorRow(
          variants: widget.product.variants,
          callBack: _colorChange,
          selected: selected,
        ),
        if (selected != null) _SizeRow(),
        ProductActions(
          product: this.widget.product,
          selected: selected,
        ),
      ],
    )
        //: Container(),
        );
  }

  _colorChange(e) {
    this.setState(() {
      selected = e;
    });
  }
}

class _ColorRow extends StatelessWidget {
  final List<Variants> variants;
  final Function callBack;
  final Variants selected;

  const _ColorRow({Key key, this.variants, this.callBack, this.selected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (selected == null) return Container();

    return Card(
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTitle(
              title: "Color",
              padding: EdgeInsets.only(bottom: 10),
            ),
            Row(children: [...variants.map((e) => _colorImage(e)).toList()])
          ],
        ),
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
            padding: EdgeInsets.only(top: 5),
          )
        ],
      ),
    );
  }
}

class _SizeRow extends StatelessWidget {
  const _SizeRow({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Column(
        children: [
          Row(
            children: [
              AppTitle(
                title: "Size (UK) ",
                padding: EdgeInsets.only(bottom: 5),
              ),
              Spacer(),
              AppTitle(
                title: "Size Chart",
                color: AppColors.darkBlue,
              )
            ],
          ),
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.greyBorder)),
                height: 60,
                width: 60,
                child: AppTitle(
                  title: "6.0",
                ),
              ),
              SizedBox(width: 10),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.greyBorder)),
                height: 60,
                width: 60,
                child: AppTitle(
                  title: "5.0",
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
