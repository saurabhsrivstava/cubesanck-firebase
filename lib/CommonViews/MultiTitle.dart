import 'package:flutter/material.dart';

class MultiTitle extends StatelessWidget {
  final Widget title;
  final Widget subTitle;
  final double top;
  final double bottom;

  const MultiTitle(
      {Key key, this.title, this.subTitle, this.bottom = 0, this.top = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: top, bottom: bottom),
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          title,
          Flexible(
            child: subTitle,
          )
        ],
      ),
    );
  }
}
