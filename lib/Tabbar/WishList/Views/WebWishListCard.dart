import 'package:cached_network_image/cached_network_image.dart';
import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Screens/Products/Models/Products.dart';
import 'package:cubesnack/Screens/Products/Pages/ProductDescriptionPage.dart';
import 'package:cubesnack/Tabbar/Home/Views/ProductShippingInfoCell.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class WebWishListCard extends StatelessWidget {
  final Products product;

  const WebWishListCard({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDescriptionPage(
                      id: product.id,
                    )));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        elevation: 2,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 0,
                child: Row(
                  children: [
                    Spacer(),
                    Icon(Icons.shopping_cart_outlined),
                  ],
                ),
              ),
              Expanded(
                flex: 10,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _ProductImage(
                      url: product?.image?.image,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 6,
                child: AppTitle(
                  title: product.title,
                  maxLines: 2,
                  padding: EdgeInsets.only(
                    top: 20,
                  ),
                  fontSize: AppFont.title4,
                  fontWeight: AppFont.medium,
                  textAlign: TextAlign.start,
                ),
              ),
              Expanded(flex: 0, child: _priceRow()),
              Expanded(flex: 4, child: Divider()),
              Expanded(
                flex: 6,
                child: ProductShippingInfoCell(
                  product: product,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _priceRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppTitle(
          title: "\$ ${product.discountedPrice}",
          fontWeight: AppFont.semiBold,
          padding: EdgeInsets.only(right: 5),
          fontSize: AppFont.title4,
        ),
        AppTitle(
          title: "\$ ${product.price}",
          fontSize: AppFont.title2,
          padding: EdgeInsets.only(right: 10),
          decoration: TextDecoration.lineThrough,
        ),
        AppTitle(
          title: "(${product.offerPercenntage}% off)",
          fontSize: AppFont.title2,
        ),
        Spacer(),
        _ratting()
      ],
    );
  }

  _ratting() {
    return Container(
      alignment: Alignment.center,
      width: 30,
      padding: EdgeInsets.all(2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.star,
            size: 10,
            color: Colors.white,
          ),
          AppTitle(
            title: "${product.rating}",
            color: Colors.white,
            fontSize: AppFont.title1,
          )
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppColors.darkBlue),
    );
  }
}

class _ProductImage extends StatelessWidget {
  final String url;

  const _ProductImage({Key key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          child: CachedNetworkImage(
            fit: BoxFit.contain,
        imageUrl: url,
      )),
    );
  }
}
