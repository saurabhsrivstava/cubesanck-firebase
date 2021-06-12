import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';

class LoginTitle extends StatelessWidget {
  final String title;
  final String details;
  const LoginTitle({Key key, this.title, this.details}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AppTitle(
            title: title,
            fontWeight: FontWeight.w800,
            color: AppColors.grey700,
            fontSize: AppFont.header,
            isLocalised: true,
          ),
          SizedBox(
            height: 10,
          ),
          AppTitle(
            title: details,
            color: AppColors.grey700,
            fontSize: AppFont.title3,
            textAlign: TextAlign.start,
            isLocalised: true,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
