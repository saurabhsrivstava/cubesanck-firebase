
import 'package:cubesnack/CommonViews/AppRoundButton.dart';
import 'package:cubesnack/CommonViews/AppTextView.dart';
import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/CommonViews/DropDownMenu.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImprovePageView extends StatefulWidget {
  @override
  _ImprovePageViewState createState() => _ImprovePageViewState();
}

class _ImprovePageViewState extends State<ImprovePageView> {
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
                  "assets/images/improve_page.svg",
                  width: 15,
                  height: 15,
                ),
                AppTitle(
                  title: "Help us to improve this page.",
                  color: AppColors.blackLight,
                  padding: EdgeInsets.all(10),
                  fontSize: AppFont.title5,
                  fontWeight: AppFont.semiBold,
                ),
              ],
            ),
            Container(
              child: AppTextView(
                top: 20,
                bottom: 20,
                titleColor: Colors.black,
                titleFontSize: AppFont.title3,
                titleFontWeight: AppFont.semiBold,
                onChange: (String v) {},
                hintText: "Type your feedback about this page.",
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
