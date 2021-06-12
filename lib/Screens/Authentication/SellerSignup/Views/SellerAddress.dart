import 'package:cubesnack/CommonViews/AppDropdown.dart';
import 'package:cubesnack/CommonViews/AppTextField.dart';
import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Constants/Constants.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Pages/BusinessInfo/Models/BusinessInfo.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:cubesnack/Utils/UserSession.dart';
import 'package:flutter/material.dart';

class SellerAddress extends StatefulWidget {
  final Address address;

  final String title;
  const SellerAddress({Key key, this.title, this.address}) : super(key: key);

  @override
  _SellerAddressState createState() => _SellerAddressState();
}

class _SellerAddressState extends State<SellerAddress> {
  final allStates = states.map((e) => e["name"]).toList();

  @override
  void initState() {
    widget.address.state =
        widget.address.state == null ? allStates.first : widget.address.state;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final allStates = states.map((e) => e["name"]).toList();
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          widget.title != null
              ? Container(
                  child: AppTitle(
                    title: widget.title,
                    fontSize: AppFont.title3,
                    isLocalised: true,
                  ),
                  margin: EdgeInsets.only(top: 15),
                )
              : Container(),
          AppTextField(
            value: widget.address.address1,
            hintText: "Street Address*",
            topMargin: 5,
            onChange: (v) {
              widget.address.address1 = v;
            },
          ),
          AppTextField(
            value: widget.address.address2,
            hintText: "Address line2(Optioal)",
            topMargin: 10,
            onChange: (v) {
              widget.address.address2 = v;
            },
          ),
          AppTextField(
            value: widget.address.city,
            hintText: "City*",
            topMargin: 10,
            onChange: (v) {
              widget.address.city = v;
            },
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: AppDropdown(
                top: 10,
                data: allStates,
                valueCallBack: (v, index) {
                  widget.address.state = v;
                },
                defaultValue: widget.address.state,
                hintText: "State*",
              )),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: AppTextField(
                  value: widget.address.zip,
                  hintText: "Zip*",
                  topMargin: 10,
                  onChange: (v) {
                    widget.address.zip = v;
                  },
                  keyBoardType: TextInputType.number,
                ),
              ),
            ],
          ),
          AppTextField(
            hintText: "Phone",
            value: widget.address.phone,
            topMargin: 10,
            onChange: (v) {
              widget.address.phone = v;
            },
            keyBoardType: TextInputType.number,
          ),
        ],
      ),
    );
  }

  Future<List<String>> _getState() async {
    return UserSession.shared.getStates();
  }
}
