import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Screens/Cart/Views/NavCartView.dart';
import 'package:cubesnack/Screens/Routes/AppRoutes.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:cubesnack/Utils/UserSession.dart';
import 'package:flutter/material.dart';

import 'AppTextField.dart';

class Navbar extends PreferredSize {
  final String title;
  final double height;
  final bool isSearch;
  final bool isCart;
  final bool isLocalised;
  final Function searchCallBack;

  Navbar(
      {this.height = kToolbarHeight,
      @required this.title,
      this.isSearch = false,
      this.isCart = false,
      this.isLocalised = true,
      this.searchCallBack});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: white,
      actions: [
        isCart && UserSession.shared.isLoggedIn() ? NavCartView() : Container()
      ],
      iconTheme: IconThemeData(
        color: Colors.black, //change your color here
      ),
      title: isSearch
          ? _searchBar()
          : AppTitle(
              title: title,
              fontSize: 22,
              color: Colors.black54,
              fontWeight: FontWeight.w600,
              isLocalised: isLocalised,
            ),
    );
  }

  _searchBar() {
    return GestureDetector(
      onTap: () => searchCallBack(),
      child: Container(
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.lightGrey, width: 1),
            borderRadius: BorderRadius.circular(4)),
        child: AppTextField(
          enabled: false,
          height: 34,
          isRightIcon: true,
          hintText: "Search anything",
          rightIcon: Icon(
            Icons.search,
            color: AppColors.lightGrey,
          ),
        ),
      ),
    );
  }

  _cartView(context) {
    return IconButton(
      icon: Icon(Icons.shopping_cart, color: AppColors.lightGrey),
      onPressed: () {
        Navigator.pushNamed(context, AppRoutes.cart);
      },
    );
  }
}

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
