import 'package:cubesnack/CommonViews/AppRoundButton.dart';
import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Screens/Authentication/FreeLancer/Models/MAccountSec.dart';
import 'package:cubesnack/Screens/Authentication/OTP/Views/OTPBuilder.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';

class FcAccountSecurityView extends StatelessWidget {
  final List<TextEditingController> controllers;
  final Function nextPress;
  final MAccountSec account;
  const FcAccountSecurityView(
      {Key key, this.controllers, this.nextPress, this.account})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          AppTitle(
            title: "Verify Phone Number",
            fontSize: AppFont.header,
            fontWeight: AppFont.extraBold,
            padding: EdgeInsets.only(top: 40),
            color: AppColors.grey700,
          ),
          AppTitle(
            title: "A Verification code has send to ${account.phone}",
            fontSize: AppFont.title1,
            maxLines: 2,
            padding: EdgeInsets.all(10),
          ),
          Container(
            margin: EdgeInsets.all(30),
            width: 250,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                OTPDigitTextFieldBox(
                  first: true,
                  last: false,
                  controller: controllers[0],
                ),
                OTPDigitTextFieldBox(
                  first: false,
                  last: false,
                  controller: controllers[1],
                ),
                OTPDigitTextFieldBox(
                  first: false,
                  last: false,
                  controller: controllers[2],
                ),
                OTPDigitTextFieldBox(
                  first: false,
                  last: false,
                  controller: controllers[3],
                ),
                OTPDigitTextFieldBox(
                  first: false,
                  last: false,
                  controller: controllers[4],
                ),
                OTPDigitTextFieldBox(
                  first: false,
                  last: true,
                  controller: controllers[5],
                ),
              ],
            ),
          ),
          AppRoundButton(
            title: "submit",
            backgroundColor: AppColors.darkBlue,
            margin: 40,
            onPressed: () => this.nextPress(),
          ),
        ],
      ),
    );
  }
}
