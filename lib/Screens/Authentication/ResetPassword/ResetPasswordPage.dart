import 'package:cubesnack/CommonViews/AppRoundButton.dart';
import 'package:cubesnack/CommonViews/AppTextField.dart';
import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:cubesnack/WebBuilder/WebBuilder.dart';
import 'package:flutter/material.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebBuilder(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(),
              Card(
                child: Column(
                  children: <Widget>[
                    AppTitle(
                      title: "Reset Your Password?",
                      fontSize: AppFont.title5,
                    ),
                    AppTitle(
                      title:
                          "Set the new password of your account\ncan login and access all the features.",
                      fontSize: AppFont.title2,
                    ),
                    AppTextField(
                      hintText: "New Password",
                    ),
                    AppTextField(
                      hintText: "Confirm Password",
                    ),
                    AppRoundButton(
                      margin: 20,
                      title: "resePassword",
                      onPressed: () {},
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
