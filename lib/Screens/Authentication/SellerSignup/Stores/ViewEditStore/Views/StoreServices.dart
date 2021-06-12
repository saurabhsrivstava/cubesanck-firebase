import 'package:cubesnack/CommonViews/AppDropdown.dart';
import 'package:cubesnack/CommonViews/AppGroupCheckbox.dart';
import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/CommonViews/AppTitleTextField.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Pages/BusinessInfo/Models/MStore.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:cubesnack/Constants/AppEnums.dart';
import 'StoreTimings.dart';

class StoreServices extends StatelessWidget {
  final MStore store;
  const StoreServices({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AppTitle(
            title: "Choose your services.",
            fontSize: AppFont.title4,
            fontWeight: AppFont.bold,
          ),
          _StoreOpenStatus(
            store: store,
          ),
          AppGroupCheckbox(
            data: ["Yes", "No"],
            title: "Do you offer same day delivery ?",
            valueCallBack: (v, i) {
              store.isSameDayDelivery = v == "Yes" ? true : false;
            },
            value: store.isSameDayDelivery ? "Yes" : "No",
            top: 20,
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AppTitle(
                  title: "Choose maximum distance",
                  fontSize: AppFont.title3,
                ),
                AppDropdown(
                  top: 5,
                  data: ["5", "10"],
                  defaultValue: "5",
                  valueCallBack: (String v, index) {
                    store.maxDistance = v.toInt();
                  },
                  hintText: "select",
                ),
              ],
            ),
          ),
          AppTitleTextField(
            title: "Extra delivery charges (optional)",
            marginTop: 15,
            onChange: (String v) {
              store.extraDeliveryCharge = v.toInt();
            },
            value: store.extraDeliveryCharge.toString(),
          ),
          AppTitleTextField(
            title: "Minimum order amount for home delivery (optional)",
            marginTop: 15,
            onChange: (String v) {
              store.minOrderAmount = v.toInt();
            },
            value: store.minOrderAmount.toString(),
          ),
          AppGroupCheckbox(
            data: ["Yes", "No"],
            title: "Would you like to offer shipping ?",
            valueCallBack: (v, i) {
              store.isFreeShiping = v == "Yes" ? true : false;
            },
            value: store.isFreeShiping ? "Yes" : "No",
          ),
          AppGroupCheckbox(
            data: ["Yes", "No"],
            title: "Select store status",
            valueCallBack: (v, i) {
              store.status = v == "Yes" ? true : false;
            },
            value: store.status ? "Yes" : "No",
          ),
        ],
      ),
    );
  }
}

class _StoreOpenStatus extends StatefulWidget {
  final MStore store;

  _StoreOpenStatus({Key key, this.store}) : super(key: key);

  @override
  __StoreOpenStatusState createState() => __StoreOpenStatusState();
}

class __StoreOpenStatusState extends State<_StoreOpenStatus> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          AppGroupCheckbox(
            top: 5,
            data: ["Yes", "No"],
            title: "Do you offer store pickup?",
            valueCallBack: (v, i) {
              this.setState(() {
                this.widget.store.isStorePickup = v == "Yes" ? true : false;
              });
            },
            value: this.widget.store.isStorePickup ? "Yes" : "No",
          ),
          if (this.widget.store.isStorePickup)
            StoreTimings(
              store: this.widget.store,
            ),
        ],
      ),
    );
  }
}
