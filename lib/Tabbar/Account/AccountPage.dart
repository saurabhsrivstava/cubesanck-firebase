import 'package:cubesnack/CommonViews/Navbar.dart';
import 'package:cubesnack/Tabbar/Account/Views/AccountBuilder.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: Navbar(
      //   title: "Accounts",
      // ),
      body: AccountBuilder(),
    );
  }
}
