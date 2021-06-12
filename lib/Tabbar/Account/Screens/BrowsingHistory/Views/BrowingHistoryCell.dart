import 'package:cubesnack/CommonViews/AppRoundButton.dart';
import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/CommonViews/RattingRow.dart';
import 'package:cubesnack/Screens/Orders/SellerOrders/ManageOrder/Views/ManageOrderCell.dart';
import 'package:cubesnack/Screens/Products/Models/Products.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';

class BrowingHistoryCell extends StatelessWidget {
  final Products product;
  const BrowingHistoryCell({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ProductImage(
                url: product?.image?.image,
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _ProductNameRow(
                    product: product,
                  ),
                  _RattingRow(
                    product: product,
                  ),
                  _PriceRow(
                    product: product,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  _Actions()
                ],
              )
            ],
          ),
        ),
        Divider()
      ],
    );
  }
}

class _ProductNameRow extends StatelessWidget {
  final Products product;
  const _ProductNameRow({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width - 170,
          child: AppTitle(
            title: product?.title,
            maxLines: 2,
            textAlign: TextAlign.left,
          ),
        ),
        IconButton(icon: Icon(Icons.arrow_forward_ios), onPressed: null)
      ],
    );
  }
}

class _RattingRow extends StatelessWidget {
  final Products product;
  const _RattingRow({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RattingRow(
            rattig: product?.rating?.toDouble(),
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.favorite),
                onPressed: null,
                padding: EdgeInsets.all(0),
              ),
              IconButton(
                  icon: Icon(Icons.share),
                  onPressed: null,
                  padding: EdgeInsets.all(0)),
            ],
          ),
        ],
      ),
    );
  }
}

class _PriceRow extends StatelessWidget {
  final Products product;

  const _PriceRow({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppTitle(title: "\$ ${product?.price}"),
          AppTitle(
            title: "\$ ${product?.offerPercenntage}",
            decoration: TextDecoration.lineThrough,
            color: AppColors.grey600,
          ),
          Row(
            children: [
              Icon(Icons.local_shipping),
              AppTitle(title: product.isFreeShipping ? "Free shipping" : ""),
            ],
          )
        ],
      ),
    );
  }
}

class _Actions extends StatelessWidget {
  const _Actions({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppRoundButton(
          title: "addToCart",
          height: 30,
          backgroundColor: Colors.white,
          borderColor: AppColors.greyBorder,
          isBorder: true,
          titleColor: Colors.black,
        ),
        SizedBox(
          width: 20,
        ),
        AppRoundButton(
          title: "buyNow",
          height: 30,
          backgroundColor: AppColors.darkBlue,
          isRightIcon: false,
        ),
      ],
    );
  }
}
