import 'package:cubesnack/Screens/Notifications/Pages/NotificationPage.dart';
import 'package:cubesnack/Tabbar/Account/MasterAccountPage.dart';
import 'package:cubesnack/Tabbar/WishList/WebWishListPage.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:cubesnack/Utils/Localisation.dart';
import 'package:cubesnack/Utils/PlatformInfo.dart';
import 'package:flutter/material.dart';

import 'Account/AccountPage.dart';
import 'Home/HomePage.dart';
import 'WishList/WishListPage.dart';

class AppTabbar extends StatelessWidget {
  const AppTabbar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        bottomSheet: TabBar(
          unselectedLabelColor: AppColors.lightGrey,
          labelColor: AppColors.blackLight,
          tabs: [
            Tab(
              icon: Icon(Icons.home),
              text: AppLocalizations.of(context).translate("home"),
            ),
            Tab(
              icon: Icon(Icons.message),
              text: AppLocalizations.of(context).translate("message"),
            ),
            // Tab(
            //   icon: Icon(Icons.search),
            //   text: AppLocalizations.of(context).translate("search"),
            // ),
            Tab(
              icon: Icon(Icons.favorite),
              text: AppLocalizations.of(context).translate("wishList"),
            ),
            Tab(
              icon: Icon(Icons.person),
              text: AppLocalizations.of(context).translate("account"),
            ),
          ],
        ),
        // title: Text('Tabs Demo'),
        body: TabBarView(
          children: [
            HomePage(),
            NotificationPage(),
            PlatformInfo.isDesktop(context)
                ? WebWishListPage()
                : WishListPage(),
            PlatformInfo.isDesktop(context)
                ? MasterAccountPage()
                : AccountPage(),
          ],
        ),
      ),
    );
  }
}
