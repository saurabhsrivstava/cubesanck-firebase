import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CompanyView extends StatelessWidget {
  final data = [
    {
      "name": "About",
    },
    {
      "name": "Career",
    },
    {
      "name": "Team",
    },
    {
      "name": "Contact",
    },
    {
      "name": "Become a vendor",
    },
    {
      "name": "Become a freelancer",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _createChildren());
  }

  List<Widget> _createChildren() {
    List<Widget> widgets = new List<Widget>.generate(
      data.length,
      (int index) {
        return Flexible(
          child: AppTitle(
            title: data[index]["name"],
            color: Colors.white,
            fontSize: AppFont.title2,
            fontWeight: AppFont.regular,
            textAlign: TextAlign.left,
            padding: EdgeInsets.only(top: 3, bottom: 3),
          ),
        );
      },
    );
    widgets.insert(
      0,
      AppTitle(
        title: "Company",
        color: Colors.white,
        padding: EdgeInsets.only(top: 10, bottom: 10),
        fontSize: AppFont.title5,
        fontWeight: AppFont.regular,
      ),
    );

    return widgets;
  }
}
