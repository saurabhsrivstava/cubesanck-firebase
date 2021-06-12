import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';

class AppBorderLabel extends StatelessWidget {
  final String title;
  const AppBorderLabel({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 20,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.greyBorder)),
      child: AppTitle(
        padding: EdgeInsets.only(left: 5),
        title: title,
        fontSize: AppFont.title2,
      ),
    );
  }
}
