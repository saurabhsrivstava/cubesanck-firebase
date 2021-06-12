import 'package:cubesnack/Screens/Sidemenu/Views/AboutApp.dart';
import 'package:cubesnack/Screens/Sidemenu/Views/MyAccoutOptions.dart';
import 'package:cubesnack/Screens/Sidemenu/Views/VenderManagement.dart';
import 'package:flutter/material.dart';

import 'Views/AfterLoginHeader.dart';

class SellerSideMenu extends StatelessWidget {
  const SellerSideMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        child: Drawer(
            child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AfterLoginHeader(),
                MyAccountOptions(),
                VenderManagement(),
                AboutApp()
              ],
            ),
          ],
        )));
  }
}
