import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Constants/AppEnums.dart';
import 'package:cubesnack/Screens/Authentication/FreeLancer/Pages/FrSignupPage.dart';
import 'package:cubesnack/Screens/Authentication/FreeLancer/Pages/FrSignupParentPage.dart';
import 'package:cubesnack/Screens/Authentication/Login/LoginPage.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Pages/SellerIntroPage.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/SellerSignupPage.dart';
import 'package:cubesnack/Screens/Routes/AppRoutes.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:cubesnack/Utils/UserSession.dart';
import 'package:flutter/material.dart';
import 'SideMenuRow.dart';
import 'Views/AfterLoginHeader.dart';
import 'Views/BeforeLoginHeader.dart';

class PreSidemenu extends StatelessWidget {
  const PreSidemenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLoggedIn = UserSession.shared.isLoggedIn();
    return new Drawer(
        child: new ListView(
      children: <Widget>[
        isLoggedIn ? AfterLoginHeader() : BeforeLoginHeader(),
        Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Card(
            elevation: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Divider(
                  thickness: 0.1,
                ),
                SideMenuRow(
                  title: "homeOrders",
                  icon: Icons.home,
                  callBack: this._homePressed,
                ),
                SideMenuRow(
                  title: "buyAgain",
                  icon: Icons.view_list_outlined,
                  callBack: this._buyaginPressed,
                ),
                SideMenuRow(
                  title: "favourite",
                  icon: Icons.shopping_bag_outlined,
                  callBack: this._favouritePressed,
                ),
                SideMenuRow(
                  title: "today'sDeal",
                  icon: Icons.dynamic_feed_outlined,
                  callBack: this._todaysDealsPressed,
                ),
                SideMenuRow(
                  title: "allStores",
                  icon: Icons.dynamic_feed_outlined,
                  callBack: this._allStooresPressed,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Card(
            elevation: 3,
            child: Column(
              children: <Widget>[
                Divider(
                  thickness: 0.1,
                ),
                Opacity(
                  opacity: UserSession.shared.isSeller() ? 0.5 : 1,
                  child: SideMenuRow(
                    callBack: (contex) {
                      if (UserSession.shared.isSeller()) return;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  UserSession.shared.isLoggedIn()
                                      ? SellerIntroPage()
                                      : LoginPage()));
                    },
                    title: "sellerOnCubesnack",
                    icon: Icons.storefront_outlined,
                  ),
                ),
                SideMenuRow(
                    title: "registerAsFreelancer",
                    callBack: (contex) {
                      if (UserSession.shared.isFreelancer()) return;

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  UserSession.shared.isLoggedIn()
                                      ? FrSignupParentPage(
                                          child: FrSignupPage(),
                                          data: SignupData(),
                                        )
                                      : LoginPage()));
                    },
                    icon: Icons.person),
              ],
            ),
          ),
        ),
        _TandCRow()
      ],
    ));
  }

  _favouritePressed(context) {
    Navigator.pop(context);
    Navigator.pushNamed(context, AppRoutes.favourite);
  }

  _allStooresPressed(context) {
    Navigator.pop(context);
    Navigator.pushNamed(context, AppRoutes.allStores);
  }

  _todaysDealsPressed(context) {
    Navigator.pop(context);
  }

  _buyaginPressed(context) {
    Navigator.pop(context);
  }

  _homePressed(context) {
    Navigator.pop(context);
  }
}

class _TandCRow extends StatelessWidget {
  const _TandCRow({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 50, right: 50, top: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AppTitle(
                title: "termsOfServices",
                fontSize: AppFont.title1,
                textAlign: TextAlign.start,
                isLocalised: true,
              ),
              Container(
                height: 15,
                color: AppColors.greyBorder,
                width: 1,
              ),
              AppTitle(
                title: "privacyPolicy",
                fontSize: AppFont.title1,
                textAlign: TextAlign.start,
                isLocalised: true,
              )
            ],
          ),
          Divider(
            thickness: 0.5,
          )
        ],
      ),
    );
  }
}
