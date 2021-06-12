import 'package:cubesnack/CommonViews/Navbar.dart';
import 'package:cubesnack/Constants/AppEnums.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Stores/ViewEditStore/SellerViewEditStore.dart';
import 'package:flutter/material.dart';

class SellerViewEditStorePages extends StatelessWidget {
  final String id;
  const SellerViewEditStorePages({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(
        title: "viewStore",
      ),
      body: SingleChildScrollView(
          child: SellerViewEditStore(
        id: id,
        status: PageMode.edit,
      )),
    );
  }
}
