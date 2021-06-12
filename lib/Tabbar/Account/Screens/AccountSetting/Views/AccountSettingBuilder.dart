import 'package:cubesnack/CommonViews/AppRoundButton.dart';
import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/CommonViews/AppUnderLineTextField.dart';
import 'package:cubesnack/CommonViews/ProfileImagePicker.dart';
import 'package:cubesnack/Tabbar/Account/Screens/AccountSetting/Bloc/index.dart';
import 'package:cubesnack/Tabbar/Account/Screens/AccountSetting/Models/MUserProfile.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountSettingBuilder extends StatelessWidget {
  final TextEditingController userNameCnt;
  final TextEditingController emailCnt;
  final TextEditingController phoneCnt;
  final TextEditingController passwordCnt;
  final TextEditingController confPassCnt;
  final MUserProfile profile;
  const AccountSettingBuilder(
      {Key key,
      this.confPassCnt,
      this.emailCnt,
      this.passwordCnt,
      this.phoneCnt,
      this.userNameCnt,
      this.profile})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (profile != null) {
      userNameCnt.text = profile.fullname;
      emailCnt.text = profile.email;
      phoneCnt.text = profile.contactNo;
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ProfileImagePicker(
              valueCallBack: (v) {
                profile.profilePic = v;
              },
              url: profile?.profilePic),
          Card(
            margin: EdgeInsets.all(20),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTitle(
                    title: "PersonalDetail",
                    isLocalised: true,
                    fontSize: AppFont.title5,
                    fontWeight: AppFont.bold,
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                  ),
                  AppUnderLineTextField(
                    hintText: "User Name",
                    labelText: "User Name",
                    controller: userNameCnt,
                    onChanged: (v) {
                      profile.fullname = v;
                    },
                  ),
                  AppUnderLineTextField(
                    hintText: "Email Address",
                    labelText: "Email Address",
                    controller: emailCnt,
                    onChanged: (v) {
                      profile.email = v;
                    },
                    enable: false,
                  ),
                  AppUnderLineTextField(
                    hintText: "Phone No",
                    labelText: "Phone No",
                    controller: phoneCnt,
                    onChanged: (v) {
                      profile.contactNo = v;
                    },
                  ),
                  // AppUnderLineTextField(
                  //   hintText: "Password",
                  //   labelText: "Password",
                  //   controller: passwordCnt,
                  //   obscureText: true,
                  // ),
                  // AppUnderLineTextField(
                  //   hintText: "Confirm Password",
                  //   labelText: "Confirm Password",
                  //   controller: confPassCnt,
                  //   obscureText: true,
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppRoundButton(
                        title: "updateDetails",
                        width: 150,
                        isRightIcon: false,
                        margin: 30,
                        onPressed: () => BlocProvider.of<ProfileBloc>(context)
                            .add(UpdateProfileEvent(profile: profile)),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
