import 'package:cached_network_image/cached_network_image.dart';
import 'package:cubesnack/Screens/Products/Models/Products.dart';
import 'package:cubesnack/Screens/Products/Pages/ProductDescriptionPage.dart';
import 'package:cubesnack/Tabbar/Home/Views/ProductInfoCell.dart';
import 'package:cubesnack/Tabbar/Home/Views/ProductShippingInfoCell.dart';
import 'package:flutter/material.dart';

class HomeProductCard extends StatelessWidget {
  final Products product;
  const HomeProductCard({Key key, this.product}) : super(key: key);

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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 2,
          child: Container(
            width: size.width / 2.5,
            child: Column(
              children: [
                _ProductImage(
                  url: product?.image?.image,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      ProductInfoCell(
                        product: product,
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      ProductShippingInfoCell(
                        product: product,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ProductImage extends StatelessWidget {
  final String url;
  const _ProductImage({Key key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Expanded(
      child: Container(
          child: CachedNetworkImage(
            imageUrl: url,
            fit: BoxFit.contain,
          )),
    );
  }
}
