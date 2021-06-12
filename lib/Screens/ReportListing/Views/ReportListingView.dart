import 'package:cubesnack/CommonViews/AppRoundButton.dart';
import 'package:cubesnack/CommonViews/AppTextView.dart';
import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/CommonViews/DropDownMenu.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReportListingView extends StatefulWidget {
  @override
  _ReportListingViewState createState() => _ReportListingViewState();
}

class _ReportListingViewState extends State<ReportListingView> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        width: 400,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            InkResponse(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: CircleAvatar(
                child: Image.asset(
                  'assets/images/close.png',
                  width: 30,
                  height: 30,
                ),
                backgroundColor: Colors.white,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  "assets/images/report_listing.svg",
                  width: 15,
                  height: 15,
                ),
                AppTitle(
                  title: "Report this listing",
                  color: AppColors.blackLight,
                  padding: EdgeInsets.all(10),
                  fontSize: AppFont.title5,
                  fontWeight: AppFont.semiBold,
                ),
              ],
            ),
            Card(
              child: DropDownMenu(
                items: <String>[
                  'Prohibited Item',
                  'Counterfeit Item',
                  'Incorrect Item Description',
                  'Unclear Listing',
                  'Incorrectly Branded Item',
                  'False Advertising',
                  'Other',
                ],
                title: "Select reason",
                isExpanded: true,
              ),
            ),
            Container(
              child: AppTextView(
                top: 20,
                bottom: 20,
                titleColor: Colors.black,
                titleFontSize: AppFont.title3,
                titleFontWeight: AppFont.semiBold,
                title: "Description",
                onChange: (String v) {},
                hintText: "Describe your reason for reporting.",
              ),
            ),
            AppRoundButton(
              width: 160,
              title: "submit",
              isRightIcon: false,
            )
          ],
        ),
      ),
    );
  }
}
