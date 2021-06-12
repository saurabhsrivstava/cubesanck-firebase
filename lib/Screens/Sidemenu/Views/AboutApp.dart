import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Constants/AppEnums.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';

import 'MyAccoutOptions.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 10, top: 10, bottom: 10),
              child: AppTitle(
                title: "About App",
                fontWeight: FontWeight.w600,
                fontSize: AppFont.title4,
              ),
            ),
            ..._getOptios()
          ],
        ),
      ),
    );
  }

  _getOptios() {
    List<Widget> options = List<Widget>();
    AboutAppEnum.values
        .map((AboutAppEnum e) => options.add(OptionRow(
              title: e.title(),
              icon: e.icon(),
              showDetails: _showDetails,
              type: e,
            )))
        .toList();
    return options;
  }

  _showDetails(AboutAppEnum type, context) {
    type.showDetails(context);
  }
}
