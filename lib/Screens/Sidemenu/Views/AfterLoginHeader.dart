import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:cubesnack/Utils/UserSession.dart';
import 'package:flutter/material.dart';

class AfterLoginHeader extends StatelessWidget {
  const AfterLoginHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(15),
      // margin: EdgeInsets.only(top:50),
      height: 60,
      child: AppTitle(
        title: UserSession.shared.getUserName() ?? "",
        fontWeight: FontWeight.w700,
        fontSize: AppFont.title5,
      ),
    );
  }
}
