import 'package:cubesnack/CommonViews/AppDropdown.dart';
import 'package:cubesnack/CommonViews/AppRoundButton.dart';
import 'package:cubesnack/CommonViews/AppTitleTextField.dart';
import 'package:cubesnack/Screens/Authentication/FreeLancer/Bloc/index.dart';
import 'package:cubesnack/Screens/Authentication/FreeLancer/Models/MProfessionalInfo.dart';
import 'package:cubesnack/Screens/Authentication/FreeLancer/Views/CertificatView.dart';
import 'package:cubesnack/Screens/Authentication/FreeLancer/Views/EducationView.dart';
import 'package:cubesnack/Screens/Authentication/FreeLancer/Views/SkillView.dart';
import 'package:flutter/material.dart';

class FrProfessionalInfoView extends StatelessWidget {
  final MProfessionalInfo info;
  final Function submitPressed;
  const FrProfessionalInfoView({Key key, this.info, this.submitPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        children: [
          AppDropdown(
            data: [
              "Digital Marketing",
              "Graphics and Design",
              "Writing & Translations"
            ],
            title: "Your Occupation",
            valueCallBack: (v, i) {
              info.occupation = v;
            },
          ),
          AppTitleTextField(
            marginTop: 15,
            title: "Add Other Occupation",
          ),
          SkillView(
            skills: info.skills,
          ),
          EducationView(
            educations: info.educations,
          ),
          CertificatView(
            certificates: info.certifications,
          ),
          AppTitleTextField(
            marginTop: 15,
            title: "Personal Website",
            onChange: (v) {
              info.website = v;
            },
          ),
          AppRoundButton(
            title: "continue",
            margin: 20,
            onPressed: () => this.submitPressed(),
          )
        ],
      ),
    );
  }
}
