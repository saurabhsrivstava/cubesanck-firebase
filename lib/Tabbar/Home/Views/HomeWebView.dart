import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/CommonViews/bottom/BottomPage.dart';
import 'package:cubesnack/Tabbar/Home/Categories/Views/CategoryView.dart';
import 'package:cubesnack/Tabbar/Home/Views/HomeBannerView.dart';
import 'package:cubesnack/Tabbar/Home/Views/HomeListBuilder.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:cubesnack/Utils/PlatformInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeWebView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.only(left: size.height / 5, right: size.height / 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HomeBannerView(),
                CategoryView(),
                // Expanded(
                //   child:
                HomeListBuilder(),
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/shield.png",
                      width: 30,
                      height: 30,
                    ),
                    AppTitle(
                      title: "Shop with confidence ",
                      fontSize: AppFont.title4,
                      fontWeight: AppFont.semiBold,
                    ),
                    AppTitle(
                      title: "Purchase protection on cliqpost",
                      fontSize: AppFont.title4,
                      decoration: TextDecoration.underline,
                      fontWeight: AppFont.semiBold,
                      maxLines: 2,
                    ),
                  ],
                ),
              ],
            ),
          ),
          BottomPage(margin: 20)
        ],
      ),
    );
  }
}
