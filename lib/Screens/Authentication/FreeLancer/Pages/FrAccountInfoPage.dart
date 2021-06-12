import 'package:cubesnack/CommonViews/AppRoundButton.dart';
import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/CommonViews/AppTitleTextField.dart';
import 'package:cubesnack/Screens/Authentication/FreeLancer/Pages/FrAccountSecurityPage.dart';
import 'package:cubesnack/Screens/Authentication/FreeLancer/Pages/FrSignupParentPage.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';

class FrAccountInfoPage extends StatefulWidget {
  const FrAccountInfoPage({Key key}) : super(key: key);

  @override
  _FrAccountInfoState createState() => _FrAccountInfoState();
}

class _FrAccountInfoState extends State<FrAccountInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTitleTextField(
            title: "Email",
            onChange: (v) {
              //info.email = v;
            },
          ),
          AppTitle(
            padding: EdgeInsets.only(top: 10),
            title:
                "Please check your email and click the verification link we'have sent you.\nDid not get the verification email?",
            maxLines: 5,
            textAlign: TextAlign.left,
          ),
          AppTitleTextField(
            title: "Phone number",
            marginTop: 15,
            onChange: (v) {
              //info.phone = v;
            },
          ),
          AppTitle(
            title: "We will never share your phone number",
            padding: EdgeInsets.only(top: 10),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            child: AppRoundButton(
              title: "verifyByYourPhoneNumber",
              width: 250,
              // margin: 15,
              isRightIcon: false,
              backgroundColor: Colors.white,
              isBorder: true,
              borderColor: AppColors.greyBorder,
              titleColor: AppColors.darkBlue,
              onPressed: () {
                final data = FrSignupParentPage.of(context).data;
                //this.verifyPhonePresse();
                showModalBottomSheet(
                    context: context,
                    builder: (context) => FrSignupParentPage(
                        data: data,
                        child: FrAccountSecurityPage(
                          submit: () {},
                        )));
              },
            ),
          ),
          AppRoundButton(
            title: "continueAndCreatYourFirstGig",
            width: 290,
            //onPressed: () => callBack(),
          ),
        ],
      ),
    );
  }
}
