import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Screens/ImprovePage/ImprovePage.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImproveThisPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          SvgPicture.asset("assets/images/improve_page.svg"),
          SizedBox(
            width: 10,
          ),
          InkWell(
            splashColor: Colors.blue.withAlpha(20),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return ImprovePage();
                  });
            },
            child: AppTitle(
              textAlign: TextAlign.center,
              title: "Help us to improve this page.",
              fontSize: AppFont.title2,
              fontWeight: AppFont.regular,
              color: AppColors.darkBlue,
            ),
          ),
        ],
      ),
    );
  }
}
