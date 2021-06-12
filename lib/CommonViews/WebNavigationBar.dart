import 'package:cubesnack/CommonViews/ActionMenuButton.dart';
import 'package:cubesnack/CommonViews/DropDownMenu.dart';
import 'package:cubesnack/CommonViews/SearchField.dart';
import 'package:cubesnack/CommonViews/UserProfileActionButton.dart';
import 'package:cubesnack/Screens/Cart/Views/NavCartView.dart';
import 'package:cubesnack/Utils/UserSession.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WebNavigationBar extends PreferredSize {
  final double height;
  final bool isSearch;
  final bool isCart;
  final bool isLocalised;
  final Function searchCallBack;
  final GlobalKey<ScaffoldState> scaffoldKey;

  WebNavigationBar(
      {this.height = kToolbarHeight,
      this.isSearch = true,
      this.isCart = true,
      this.isLocalised = false,
      this.scaffoldKey,
      this.searchCallBack});

  @override
  Size get preferredSize => Size.fromHeight(110);

  @override
  Widget build(BuildContext context) {
    final isLoggedIn = UserSession.shared.isLoggedIn();
    return AppBar(
      shape: Border(bottom: BorderSide(color: Colors.grey)),
      backgroundColor: white,
      actions: [
        // ActionButton(text: "Log In/Sign Up"),
        isLoggedIn
            ? UserProfileActionButton()
            : ActionMenuButton(text: "Log In/Sign Up"),
        NavCartView(),
      ],
      leading: SvgPicture.asset(
        "assets/images/logo.svg",
      ),
      leadingWidth: 140,
      title: Container(
        height: 40,
        child: Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          margin: EdgeInsets.only(left: 20, right: 20),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          shadowColor: Colors.grey,
          child: Flex(
            mainAxisAlignment: MainAxisAlignment.center,
            direction: Axis.horizontal,
            children: <Widget>[
              DropDownMenu(
                items: <String>[
                  'Deals',
                  'Beauty',
                  'Books',
                  'Electronics',
                  'Furniture',
                  'Gifts',
                  'Cards',
                ],
                title: "PRODUCTS",
                padding: EdgeInsets.only(left: 10, right: 10),
              ),
              VerticalDivider(
                indent: 1,
                width: 1,
                thickness: 1,
                color: Colors.grey,
              ),
              SearchField()
            ],
          ),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(20.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey,
            ),
            TabBar(
              unselectedLabelColor: Colors.black,
              unselectedLabelStyle: TextStyle(color: Colors.black),
              overlayColor: MaterialStateProperty.all(Colors.blueAccent[30]),
              isScrollable: true,
              indicator: BoxDecoration(color: Colors.blueAccent),
              labelColor: Colors.white,
              onTap: (index) {
                switch (index) {
                  case 0:
                    scaffoldKey.currentState.openDrawer();
                    break;
                }
                // Should not used it as it only called when tab options are clicked,
                // not when user swapped
              },
              tabs: list,
            ),
          ],
        ),
      ),
    );
  }
}

List<Widget> list = [
  Tab(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [Icon(Icons.menu), SizedBox(width: 10), Text("All Categories")],
    ),
  ),
  Tab(text: "Appliances"),
  Tab(text: "Art supplies & Essentials"),
  Tab(text: "Automotive"),
  Tab(text: "Baby Essentials"),
  Tab(text: "Beauty, Bath & Cosmetics"),
  Tab(text: "Camera & Equipment"),
  Tab(text: "Cell Phones & Accessories"),
  Tab(text: "Clothing, Shoes & Jewellery"),
  Tab(text: "Kids"),
];

const MaterialColor white = const MaterialColor(
  0xFFFFFFFF,
  const <int, Color>{
    50: const Color(0xFFFFFFFF),
    100: const Color(0xFFFFFFFF),
    200: const Color(0xFFFFFFFF),
    300: const Color(0xFFFFFFFF),
    400: const Color(0xFFFFFFFF),
    500: const Color(0xFFFFFFFF),
    600: const Color(0xFFFFFFFF),
    700: const Color(0xFFFFFFFF),
    800: const Color(0xFFFFFFFF),
    900: const Color(0xFFFFFFFF),
  },
);
