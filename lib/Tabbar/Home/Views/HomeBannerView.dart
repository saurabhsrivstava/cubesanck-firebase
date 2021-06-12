import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeBannerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Card(
      shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10)),
      semanticContainer: true,
      clipBehavior: Clip.antiAlias,
      // margin: EdgeInsets.only(left: size.height / 5, right: size.height / 5),
      child: Image.asset(
        "assets/images/banner.png",
        width: size.width,
        height: 200,
        fit: BoxFit.cover,
      ),
    );
  }
}
