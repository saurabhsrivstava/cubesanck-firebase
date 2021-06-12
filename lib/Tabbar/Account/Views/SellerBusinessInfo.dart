import 'package:cubesnack/CommonViews/Navbar.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Pages/BusinessInfo/SellerBusinessInfoPage.dart';
import 'package:flutter/material.dart';
import 'package:cubesnack/Constants/AppEnums.dart';

class SellerBusinessInfo extends StatelessWidget {
  const SellerBusinessInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(
        title: "businessInformation",
      ),
      body: SingleChildScrollView(
          child: SellerBusinessInfoPage(
        status: PageMode.edit,
      )),
    );
  }
}
