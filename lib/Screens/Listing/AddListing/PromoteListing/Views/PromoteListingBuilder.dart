import 'package:cubesnack/CommonViews/AppCalendarButton.dart';
import 'package:cubesnack/CommonViews/AppGroupCheckbox.dart';
import 'package:cubesnack/CommonViews/AppRoundButton.dart';
import 'package:cubesnack/CommonViews/AppTitleTextField.dart';
import 'package:cubesnack/Screens/Listing/AddListing/Models/MPromoteListing.dart';
import 'package:flutter/material.dart';
import 'package:cubesnack/Constants/AppEnums.dart';

class PromoteListingBuilder extends StatelessWidget {
  final MPromoteListing listing;
  final Function continuePress;

  const PromoteListingBuilder({Key key, this.listing, this.continuePress})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          AppGroupCheckbox(
            data: ["Yes", "No"],
            title: "Do you want to promote this item?",
            bottom: 10,
            valueCallBack: (v, i) {
              listing.isPromoted = v == "Yes" ? true : false;
            },
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: AppCalendarButton(
                  callBack: (v, toSend) {
                    listing.startDate = toSend;
                  },
                  title: "startDate",
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: AppCalendarButton(
                  callBack: (v, toSend) {
                    listing.endDate = toSend;
                  },
                  title: "endDate",
                ),
              )
            ],
          ),
          AppTitleTextField(
            marginTop: 25,
            title: "Set your daily budget",
            onChange: (String v) {
              listing.dailyBudget = v.toInt();
            },
            keyBoardType: TextInputType.number,
          ),
          AppRoundButton(
            margin: 30,
            title: "submitForApproval",
            width: 200,
            onPressed: () => this.continuePress(context),
          )
        ],
      ),
    );
  }
}
