import 'package:cubesnack/CommonViews/AppGroupCheckbox.dart';
import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Pages/BusinessInfo/Models/MStore.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';

class StorePermissions extends StatelessWidget {
  final MStore store;
  const StorePermissions({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AppTitle(
            title: "Please assign access and permissions",
            fontSize: AppFont.title4,
          ),
          AppGroupCheckbox(
            data: ["Edit Only", "Full Access"],
            title: "Manage Order*",
            valueCallBack: (v, i) {
              this.store.hasManageOrder = v == "Edit Only" ? true : false;
            },
            value: this.store.hasManageOrder ? "Edit Only" : "Full Access",
          ),
          AppGroupCheckbox(
            data: ["Edit Only", "Full Access"],
            title: "Manage Inventry*",
            valueCallBack: (v, i) {
              this.store.hasManageInventory = v == "Edit Only" ? true : false;
            },
            value: this.store.hasManageInventory ? "Edit Only" : "Full Access",
            top: 20,
          ),
          AppGroupCheckbox(
            data: ["Edit Only", "Full Access"],
            title: "Manage Listing*",
            valueCallBack: (v, i) {
              this.store.hasManageListing = v == "Edit Only" ? true : false;
            },
            value: this.store.hasManageListing ? "Edit Only" : "Full Access",
            top: 20,
          ),
          AppGroupCheckbox(
            data: ["Yes", "No"],
            title:
                "Would  you like to assign this user full access to your seller account?",
            valueCallBack: (v, i) {
              this.store.hasFullAccess = v == "Yes" ? true : false;
            },
            value: this.store.hasFullAccess ? "Yes" : "No",
            top: 20,
          )
        ],
      ),
    );
  }
}
