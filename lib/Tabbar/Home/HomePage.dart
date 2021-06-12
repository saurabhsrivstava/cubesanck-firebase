import 'package:cubesnack/CommonViews/Navbar.dart';
import 'package:cubesnack/CommonViews/WebNavigationBar.dart';
import 'package:cubesnack/Screens/Routes/AppRoutes.dart';
import 'package:cubesnack/Screens/Sidemenu/PreSidemenu.dart';
import 'package:cubesnack/Tabbar/Home/Views/HomeView.dart';
import 'package:cubesnack/Tabbar/Home/Views/HomeWebView.dart';
import 'package:cubesnack/Utils/PlatformInfo.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    return Theme(
      data: ThemeData(
          primaryIconTheme: IconThemeData(color: Colors.black)), // use this
      child: DefaultTabController(
        length: 10,
        child: Scaffold(
          key: _scaffoldKey,
          appBar: PlatformInfo.isDesktop(context)
              ? WebNavigationBar(
                  scaffoldKey: _scaffoldKey,
                )
              : Navbar(
                  title: "home",
                  isCart: true,
                  isSearch: true,
                  searchCallBack: () {
                    Navigator.pushNamed(context, AppRoutes.search);
                  },
                ),

          drawer: PreSidemenu(), //SellerSideMenu(),,
          body: PlatformInfo.isDesktop(context) ? HomeWebView() : HomeView(),
        ),
      ),
    );
  }
}
