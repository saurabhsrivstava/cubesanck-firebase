import 'package:cubesnack/CommonViews/AppDropdown.dart';
import 'package:cubesnack/CommonViews/AppRoundButton.dart';
import 'package:cubesnack/CommonViews/AppTitleTextField.dart';
import 'package:cubesnack/Constants/AppEnums.dart';
import 'package:cubesnack/Screens/Gig/AddGigParentContainer.dart';
import 'package:cubesnack/Screens/Gig/Views/GigFormate.dart';
import 'package:cubesnack/Screens/Gig/Views/GigTags.dart';
import 'package:flutter/material.dart';

class AddGigDetailView extends StatelessWidget {
  const AddGigDetailView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        children: [
          AppTitleTextField(
            title: "Gig Title",
          ),
          AppDropdown(
            top: 15,
            data: [
              "Grafics & Designs",
              "Digital Marketing",
              "Writing & Translation",
              "Vedio & Animation",
              "Music and Audio",
              "Programing & Tech"
            ],
            title: "Choose Category",
          ),
          AppDropdown(
            top: 15,
            data: [
              "Social Media Advertising",
              "SEO",
              "Public Relations",
              "Content Marketing",
              "Podcast Marketing",
              "Tech Message Marketing"
            ],
            title: "Sub Category",
          ),
          SizedBox(
            height: 15,
          ),
          GigFormate(
            valueCall: (v) {},
          ),
          GigTags(),
          AppRoundButton(
            title: "submit",
            margin: 50,
            onPressed: () {
              AddGigParentContainer.of(context)
                  .data
                  .stepCallBack(AddGigSteps.scope);
            },
          )
        ],
      ),
    );
  }
}
