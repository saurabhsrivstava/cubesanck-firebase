import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 60,
          height: 1,
          color: AppColors.greyBorder,
        ),
        Text("or"),
        Container(
          width: 60,
          height: 1,
          color: AppColors.greyBorder,
        ),
      ],
    );
  }
}
