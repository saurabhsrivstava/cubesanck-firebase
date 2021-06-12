import 'package:cubesnack/CommonViews/AppRoundButton.dart';
import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppErrorView extends StatelessWidget {
  final String error;
  final Function callBack;
  const AppErrorView({Key key, this.error, @required this.callBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/home/NoresultFound.svg",
              height: 250,
            ),
            AppTitle(
              title: this.error,
              maxLines: 4,
              fontSize: AppFont.title4,
              fontWeight: AppFont.bold,
            ),
            SizedBox(
              height: 20,
            ),
            AppRoundButton(
              height: 30,
              title: "tryAgain",
              isBorder: true,
              isRightIcon: false,
              backgroundColor: Colors.white,
              titleColor: AppColors.darkBlue,
              onPressed: () => callBack(),
            )
          ],
        ),
      ),
    );
  }
}
