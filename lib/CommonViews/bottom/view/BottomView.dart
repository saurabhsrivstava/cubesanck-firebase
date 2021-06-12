import 'package:cubesnack/CommonViews/bottom/view/BottomLine.dart';
import 'package:cubesnack/CommonViews/bottom/view/TopLine.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BottomView extends StatelessWidget {
  final double margin;

  const BottomView({this.margin = 0, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: 200,
      padding: EdgeInsets.only(
          left: size.height / 5, right: size.height / 5, bottom: 20),
      margin: EdgeInsets.only(top: margin),
      color: AppColors.bottom,
      child: Column(
        children: [
          TopLine(),
          Divider(
            color: AppColors.grey100,
          ),
          BottomLine(),
        ],
      ),
    );
  }
}
