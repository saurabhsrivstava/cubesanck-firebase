import 'package:flutter/material.dart';

class AppLoader extends StatelessWidget {
  final double height;
  final double weidth;
  final Color bgColor;
  final Animation<Color> circleColor;
  AppLoader({this.bgColor, this.circleColor, this.height, this.weidth});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height ?? MediaQuery.of(context).size.height,
      color: bgColor ?? Colors.grey.withOpacity(0.8),
      child: Center(
        child: CircularProgressIndicator(
          valueColor: this.circleColor,
          backgroundColor: bgColor,
        ),
      ),
    );
  }
}
