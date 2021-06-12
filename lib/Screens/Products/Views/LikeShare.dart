
import 'package:cubesnack/Screens/Products/Models/Products.dart';
import 'package:cubesnack/Screens/Products/Views/ProductLikeView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LikeShare extends StatelessWidget {
  final Products product;

  const LikeShare({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ProductLikeView(
            product: product,
          ),
          IconButton(
            icon: SvgPicture.asset("assets/images/Share.svg"),
            onPressed: null,
            padding: EdgeInsets.zero,
          )
        ],
      ),
    );
  }
}
