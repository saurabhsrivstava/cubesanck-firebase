import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Constants/AppEnums.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:cubesnack/Utils/PlatformInfo.dart';
import 'package:flutter/material.dart';

import 'MyAccoutOptions.dart';

class VenderManagement extends StatelessWidget {
  final Function vender;

  const VenderManagement({Key key, this.vender}) : super(key: key);

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
                title: "Vender Management",
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
    VenderManagementEnum.values
        .map((VenderManagementEnum e) => options.add(OptionRow(
              title: e.title(),
              icon: e.icon(),
              showDetails: this._showDetails,
              type: e,
            )))
        .toList();
    return options;
  }

  _showDetails(VenderManagementEnum e, BuildContext context) {
    if (PlatformInfo.isDesktop(context)) {
      this.vender(e);
    } else {
      e.showDetails(context);
    }
  }
}
