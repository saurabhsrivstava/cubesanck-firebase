import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';

class StorePolicyText extends StatelessWidget {
  const StorePolicyText({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppTitle(
            title: "yourStorePolicy",
            fontWeight: FontWeight.w600,
            fontSize: AppFont.title4,
            isLocalised: true,
          ),
          AppTitle(
            title: "seeYourPolicy",
            fontSize: AppFont.title1,
            isLocalised: true,
          )
        ],
      ),
    );
  }
}
