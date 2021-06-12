import 'package:cubesnack/CommonViews/MultiTitle.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:cubesnack/Utils/Util.dart';
import 'package:flutter/material.dart';

import 'AppTextField.dart';
import 'AppTitle.dart';

class AppTitleTextField extends StatelessWidget {
  final double marginTop;
  final String title;
  final String subTitle;
  final Function onChange;
  final TextEditingController controller;
  final double height;
  final String value;
  final TextInputType keyBoardType;
  const AppTitleTextField(
      {Key key,
      this.marginTop,
      this.title,
      this.subTitle = '',
      this.onChange,
      this.controller,
      this.height,
      this.value,
      this.keyBoardType = TextInputType.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    appPrint(value);
    return Container(
      margin: EdgeInsets.only(
        top: marginTop ?? 0.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MultiTitle(
            title: AppTitle(
              title: this.title,
              fontSize: AppFont.title2,
            ),
            subTitle: AppTitle(
              title: this.subTitle,
              fontSize: AppFont.title1,
            ),
          ),
          AppTextField(
            hintText: title,
            topMargin: 5,
            onChange: this.onChange,
            controller: controller,
            height: height,
            value: this.value,
            keyBoardType: keyBoardType,
          )
        ],
      ),
    );
  }
}
