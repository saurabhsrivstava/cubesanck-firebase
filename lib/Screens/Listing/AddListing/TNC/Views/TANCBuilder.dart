import 'package:cubesnack/CommonViews/AppDropdown.dart';
import 'package:cubesnack/CommonViews/AppGroupCheckbox.dart';
import 'package:cubesnack/CommonViews/AppRoundButton.dart';
import 'package:cubesnack/CommonViews/AppTextView.dart';
import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/CommonViews/BrowseFilePreview.dart';
import 'package:cubesnack/CommonViews/DocumentPicker.dart';
import 'package:cubesnack/Screens/Listing/AddListing/Models/MTAC.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:cubesnack/Utils/Localisation.dart';
import 'package:flutter/material.dart';
import 'package:cubesnack/Constants/AppEnums.dart';
import 'ReturnConditions.dart';
import 'StorePolicyText.dart';

class TANCBuilder extends StatelessWidget {
  final Function continuePress;
  final MTAC tAndC;

  const TANCBuilder({Key key, this.continuePress, this.tAndC})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        children: [
          StorePolicyText(),
          AppGroupCheckbox(
              top: 15,
              bottom: 20,
              valueCallBack: (v, i) {
                tAndC.isReturnAccepted = v == "Return accepted" ? true : false;
              },
              data: ["Return accepted", "Return not accepted"],
              title:
                  AppLocalizations.of(context).translate("returnOrExchange")),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTitle(
                title: "How Many Days",
                padding: EdgeInsets.only(bottom: 5),
                fontSize: AppFont.title3,
              ),
              AppDropdown(
                data: ["5 days", "10 days", "15 days", "20 days"],
                hintText: "How Many Days",
                valueCallBack: (String v, index) {
                  tAndC.days = v.split(" ").first.toInt();
                },
              ),
            ],
          ),
          ReturnConditions(
            points: tAndC.conditionsAcceptingReturns,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTitle(title: "Warranty Info"),
              DocumentPicker(statusCallBack: (v) {
                tAndC.warrantyInformation.document = v;
              }),
              SizedBox(height: 10),
              AppTextView(
                onChange: (v) {
                  tAndC.warrantyInformation.information = v;
                },
              ),
            ],
          ),
          AppTextView(
            title: "Legal disclaimer",
            top: 10,
            bottom: 10,
            onChange: (v) {
              tAndC.legalDisclaimer = v;
            },
          ),
          AppRoundButton(
              width: 180,
              title: "continue",
              onPressed: () => this.continuePress(context))
        ],
      ),
    );
  }
}
