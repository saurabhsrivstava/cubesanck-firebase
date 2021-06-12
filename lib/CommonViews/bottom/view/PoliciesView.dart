import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';

class PoliciesView extends StatelessWidget {
  final data = [
    {
      "name": "Privacy Policy",
    },
    {
      "name": "Terms and Conditions",
    },
    {
      "name": "Copyright Policy",
    },
    {
      "name": "Cancelattion & Return Policy",
    },
    {
      "name": "100% Purchase Protection",
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
        title: "Policies",
        color: Colors.white,
        padding: EdgeInsets.only(top: 10, bottom: 10),
        fontSize: AppFont.title5,
        fontWeight: AppFont.regular,
      ),
    );

    return widgets;
  }
}
