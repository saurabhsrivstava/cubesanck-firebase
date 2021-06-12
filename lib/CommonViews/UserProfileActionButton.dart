
import 'package:cubesnack/Tabbar/Account/AccountPage.dart';
import 'package:cubesnack/Tabbar/Account/MasterAccountPage.dart';
import 'package:cubesnack/Utils/PlatformInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserProfileActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 2,
      shape: CircleBorder(side: BorderSide(color: Colors.blue)),
      shadowColor: Colors.grey,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          Navigator.pop(context);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PlatformInfo.isDesktop(context)
                    ? MasterAccountPage()
                    : AccountPage(),
              ));
        },
        child: CircleAvatar(
          backgroundImage: AssetImage("assets/images/user.png"),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
