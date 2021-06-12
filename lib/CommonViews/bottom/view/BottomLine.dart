import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomLine extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 0,
      fit: FlexFit.tight,
      child: Row(
        children: [
          AppTitle(
              color: Colors.white,
              title: '\u00a9 2021 Cubesnack | All Rights Reserved'),
          Spacer(),
          Image.asset(
            "assets/images/cards.png",
            width: 150,
          ),
          Spacer(),
          Image.asset(
            "assets/images/Social media.png",
            width: 100,
          ),
        ],
      ),
    );
  }

}