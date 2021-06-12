import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:flutter/material.dart';

class AppUnderLineButton extends StatelessWidget {
  final double height;
  final String title;
  final Color underLineColor;
  final double unnderLineWidth;
  final Function onPress;
  const AppUnderLineButton(
      {Key key,
      this.height = 35,
      this.title = '',
      this.underLineColor = Colors.black,
      this.onPress,
      this.unnderLineWidth = 1.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        height: height,
        child: AppTitle(
          title: title,
        ),
        shape: Border(
            bottom: BorderSide(color: underLineColor, width: unnderLineWidth)),
        onPressed: () => this.onPress());
  }
}
