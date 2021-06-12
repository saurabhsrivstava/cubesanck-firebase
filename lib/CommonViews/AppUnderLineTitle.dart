import 'package:flutter/material.dart';

class AppUnderLineTitle extends StatelessWidget {
  final String title;
  final Color color;
  final double fontSize;
  const AppUnderLineTitle(
      {Key key, this.title, this.color = Colors.black, this.fontSize = 12})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        title,
        style: TextStyle(
            decoration: TextDecoration.underline,
            color: color,
            fontSize: fontSize),
      ),
    );
  }
}
