import 'package:cubesnack/CommonViews/AppRoundButton.dart';
import 'package:cubesnack/Screens/Authentication/Login/Bloc/index.dart';
import 'package:cubesnack/Screens/Authentication/Login/LoginPage.dart';
import 'package:cubesnack/Screens/Authentication/Signup/SignupPage.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:cubesnack/Utils/Localisation.dart';
import 'package:flutter/material.dart';

class BeforeLoginHeader extends StatelessWidget {
  const BeforeLoginHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          AppRoundButton(
            margin: 20,
            title: "login",
            isBorder: true,
            borderColor: AppColors.greyBorder,
            backgroundColor: Colors.white,
            titleColor: Colors.black,
            width: 110,
            isRightIcon: false,
            height: 45,
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
          ),
          AppRoundButton(
            margin: 20,
            title: "signup",
            width: 110,
            isBorder: true,
            borderColor: AppColors.greyBorder,
            backgroundColor: Colors.white,
            titleColor: Colors.black,
            isRightIcon: false,
            height: 45,
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SignupPage(
                              bloc: LoginBloc(
                            UnLoginState(),
                          ))));
            },
          )
        ],
      ),
    );
  }
}
