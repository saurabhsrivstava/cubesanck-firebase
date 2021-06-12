import 'package:flutter/material.dart';

class AppVerticleDivider extends StatelessWidget {
  final double leftMargin;
  const AppVerticleDivider({Key key, this.leftMargin = 0.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: leftMargin),
      height: 40,
      width: 1,
      color: Colors.grey[300],
    );
  }
}
