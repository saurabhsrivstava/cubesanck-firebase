import 'package:cubesnack/CommonViews/AppGroupCheckbox.dart';
import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/CommonViews/AppTitleTextField.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Pages/BusinessInfo/Models/MStore.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';

import 'StorePermissions.dart';

class StoreManagerInfo extends StatefulWidget {
  final MStore store;
  const StoreManagerInfo({Key key, this.store}) : super(key: key);

  @override
  _StoreManagerInfoState createState() => _StoreManagerInfoState();
}

class _StoreManagerInfoState extends State<StoreManagerInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AppTitle(
            title:
                "Would you like to assign a store manager for this location?",
            fontWeight: FontWeight.w600,
            textAlign: TextAlign.start,
            maxLines: 2,
            fontSize: AppFont.title3,
            padding: EdgeInsets.only(bottom: 5),
          ),
          AppTitle(
            title:
                "The person will be responsible for all orders related to this location",
            fontSize: AppFont.title1,
          ),
          AppGroupCheckbox(
            top: 0,
            data: ["Yes", "No"],
            title: "",
            valueCallBack: (v, i) {
              this.setState(() {
                widget.store.hasStoreManager = v == "Yes" ? true : false;
              });
            },
            value: widget.store.hasStoreManager ? "Yes" : "No",
          ),
          if (widget.store.hasStoreManager)
            Column(
              children: [
                AppTitleTextField(
                  title: "User Name*",
                  marginTop: 15,
                  onChange: (v) {
                    widget.store.managerName = v;
                  },
                  value: widget.store.managerName ?? "",
                ),
                AppTitleTextField(
                  title: "Email Address*",
                  marginTop: 15.0,
                  onChange: (v) {
                    widget.store.managerEmailAddress = v;
                  },
                  value: widget.store.managerEmailAddress ?? "",
                ),
                AppTitleTextField(
                  title: "Password*",
                  marginTop: 15.0,
                  onChange: (v) {
                    widget.store.managerPassword = v;
                  },
                  value: widget.store.managerPassword ?? "",
                ),
                StorePermissions(
                  store: widget.store,
                )
              ],
            )
        ],
      ),
    );
  }
}
