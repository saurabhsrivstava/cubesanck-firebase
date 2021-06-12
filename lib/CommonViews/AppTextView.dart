import 'package:cubesnack/CommonViews/MultiTitle.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';

import 'AppTitle.dart';

class AppTextView extends StatelessWidget {
  final String title;
  final String subTitle;
  final double top;
  final double bottom;
  final Function onChange;
  final String value;
  final Color titleColor;
  final TextEditingController controller;
  final String hintText;
  final TextDecoration decoration;
  final FontWeight fontWeight;
  final Color color;
  final double fontSize;
  final double titleFontSize;
  final FontWeight titleFontWeight;

  const AppTextView(
      {Key key,
      this.title,
      this.onChange,
      this.top = 0,
      this.bottom = 0,
      this.subTitle = '',
      this.controller,
      this.value,
      this.titleColor,
      this.fontSize,
      this.titleFontSize = 12,
      this.fontWeight = FontWeight.normal,
      this.titleFontWeight = FontWeight.normal,
      this.color = Colors.black,
      this.decoration = TextDecoration.none,
      this.hintText = 'Tell us about your business'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: top, bottom: bottom),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          this.title != null
              ? MultiTitle(
                  title: AppTitle(
                    color: titleColor,
                    title: title,
                    fontWeight: this.titleFontWeight,
                    fontSize: this.titleFontSize,
                  ),
                  subTitle: AppTitle(
                    title: this.subTitle,
                    fontSize: AppFont.title1,
                  ),
                  bottom: 5,
                )
              : Container(),
          TextFormField(
            initialValue: value,
            controller: controller,
            onChanged: (v) => this.onChange != null ? this.onChange(v) : null,
            minLines: 5,
            style: TextStyle(
                decoration: decoration,
                fontWeight: fontWeight,
                fontFamily: AppFont.proximaNova,
                fontSize: fontSize,
                color: color),
            maxLines: 7,
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
