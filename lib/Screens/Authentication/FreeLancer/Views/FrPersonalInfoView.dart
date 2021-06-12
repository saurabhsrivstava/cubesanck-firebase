import 'package:cubesnack/CommonViews/AppDropdown.dart';
import 'package:cubesnack/CommonViews/AppRoundButton.dart';
import 'package:cubesnack/CommonViews/AppTextView.dart';
import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/CommonViews/AppTitleTextField.dart';
import 'package:cubesnack/CommonViews/ProfileImagePicker.dart';
import 'package:cubesnack/Constants/AppExtensions.dart';
import 'package:cubesnack/Constants/Constants.dart';
import 'package:cubesnack/Screens/Authentication/FreeLancer/Bloc/index.dart';
import 'package:cubesnack/Screens/Authentication/FreeLancer/Models/MFrPersonalInfo.dart';
import 'package:cubesnack/Utils/UserSession.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FrPersonalInfoView extends StatelessWidget {
  final MFrPersonalInfo personalInfo;
  const FrPersonalInfoView({Key key, this.personalInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ProfileImagePicker(valueCallBack: (v) {
                personalInfo.profileId = v;
              }),
              SizedBox(
                width: 15,
              ),
              Flexible(
                child: AppTitle(
                  title:
                      "Add a profile picture of yourself so customers will know exactly who they'll be working with",
                  maxLines: 3,
                  textAlign: TextAlign.left,
                ),
              )
            ],
          ),
          AppTitleTextField(
            title: "Full Name",
            marginTop: 15,
            onChange: (v) {
              personalInfo.firstName = v;
            },
            value: personalInfo.firstName,
          ),
          AppTitleTextField(
            title: "Last Name",
            marginTop: 15,
            onChange: (v) {
              personalInfo.lastName = v;
            },
          ),
          AppDropdown(
            data: states.map((e) => e["name"]).toList(),
            title: "State",
            top: 15,
            valueCallBack: (v, i) {
              personalInfo.state = v;
            },
          ),
          AppTextView(
            top: 15,
            title: "Description",
            hintText:
                "Share a bit about your work expirience, cool projects, you've have completed and area of expirtise",
            onChange: (v) {
              personalInfo.description = v;
            },
          ),
          AppRoundButton(
            title: "continue",
            margin: 20,
            onPressed: () => _continuePress(context),
          )
        ],
      ),
    );
  }

  _continuePress(context) {
    final error = personalInfo.validate();
    if (error != null) {
      AppAlert.showAlert(
          context: context, title: "error", message: error, isLocalised: true);
      return;
    }
    BlocProvider.of<FreeLancerBloc>(context)
        .add(AddFreeLancerEvent(personalInfo: personalInfo));
  }
}
