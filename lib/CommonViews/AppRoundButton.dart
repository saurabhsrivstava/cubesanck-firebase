import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';

class AppRoundButton extends StatelessWidget {
  final double width;
  final String title;
  final double height;
  final double fontSize;
  final FontWeight fontWeight;
  final Function onPressed;
  final Color backgroundColor;
  final Color titleColor;
  final double margin;
  final bool isBorder;
  final Color borderColor;
  final isRightIcon;
  final double radius;
  final bool isLocalised;

  const AppRoundButton(
      {Key key,
      this.width = 140,
      this.height = 45,
      @required this.title,
      this.fontSize = 16,
      this.fontWeight = FontWeight.normal,
      this.onPressed,
      this.backgroundColor = AppColors.darkBlue,
      this.titleColor = Colors.white,
      this.margin = 0.0,
      this.isBorder = false,
      this.borderColor = Colors.blueAccent,
      this.isRightIcon = true,
      this.radius = 5.0,
      this.isLocalised = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        Container(
          height: height,
          width: width,
          margin: EdgeInsets.all(this.margin),
          child: FlatButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AppTitle(
                  title: this.title,
                  fontSize: this.fontSize,
                  fontWeight: this.fontWeight,
                  color: this.titleColor,
                  isLocalised: isLocalised,
                ),
                isRightIcon
                    ? Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 20,
                        ),
                      )
                    : Container()
              ],
            ),
            onPressed: () => this.onPressed(),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            border:
                isBorder ? Border.all(color: this.borderColor, width: 1) : null,
            color: this.backgroundColor,
          ),
        ),
      ],
    ));
  }
}
