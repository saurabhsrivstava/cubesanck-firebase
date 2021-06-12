import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Screens/MessageSeller%20/MessageSellerPage.dart';
import 'package:cubesnack/Screens/ReportListing/ReportListingPage.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MessageReportMore extends StatelessWidget {
  final data = [
    {
      "name": "See more item from this seller",
      "icon": SvgPicture.asset(
        "assets/images/see_more.svg",
        width: 20,
        height: 20,
      ),
      "widget": Container(),
    },
    {
      "name": "Message Seller",
      "icon": Icon(
        Icons.message_outlined,
        size: 20,
      ),
      "widget": MessageSellerPage(),
    },
    {
      "name": "Report Listing",
      "icon": SvgPicture.asset(
        "assets/images/report_listing.svg",
        width: 20,
        height: 20,
      ),
      "widget": ReportListingPage(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _createChildren(context),
    );
  }

  List<Widget> _createChildren(BuildContext context) {
    return new List<Widget>.generate(
      data.length,
      (int index) {
        return Expanded(
          child: InkWell(
            splashColor: Colors.blue.withAlpha(20),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return data[index]["widget"];
                  });
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                data[index]["icon"],
                AppTitle(
                  title: data[index]["name"],
                  color: AppColors.blue,
                  padding: EdgeInsets.fromLTRB(10, 20, 20, 20),
                  fontSize: AppFont.title3,
                  fontWeight: AppFont.regular,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
