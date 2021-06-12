import 'package:cubesnack/CommonViews/AppGroupCheckbox.dart';
import 'package:cubesnack/CommonViews/AppRoundButton.dart';
import 'package:cubesnack/CommonViews/AppTextField.dart';
import 'package:cubesnack/Constants/AppEnums.dart';
import 'package:cubesnack/Screens/Gig/AddGigParentContainer.dart';
import 'package:cubesnack/Screens/Listing/AddListing/TNC/Views/ReturnConditions.dart';
import 'package:flutter/material.dart';

class GigCustomScope extends StatefulWidget {
  const GigCustomScope({Key key}) : super(key: key);

  @override
  _GigCustomScopeState createState() => _GigCustomScopeState();
}

class _GigCustomScopeState extends State<GigCustomScope> {
  String value = "No";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AppGroupCheckbox(
            data: ["Yes", "No"],
            title: "Do you offer custom scope for this gig*",
            valueCallBack: (v, i) {
              value = v;
              this.setState(() {});
            },
            value: value,
          ),
          if (value == "Yes")
            ReturnConditions(
              points: [],
              title: "Add Gig scope",
            ),
          AppRoundButton(
            title: "save",
            margin: 15,
            onPressed: () {
              AddGigParentContainer.of(context)
                  .data
                  .stepCallBack(AddGigSteps.faq);
            },
          )
        ],
      ),
    );
  }
}
