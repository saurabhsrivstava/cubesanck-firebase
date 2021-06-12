import 'package:cubesnack/CommonViews/AppRoundButton.dart';
import 'package:cubesnack/CommonViews/AppTextField.dart';
import 'package:cubesnack/CommonViews/AppTextView.dart';
import 'package:cubesnack/Constants/AppExtensions.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Bloc/index.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Pages/BusinessInfo/Models/BusinessInfo.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Views/SellerAddress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../SellerSignupPage.dart';
import 'ShippingSettings.dart';

class SellerBusinessInfoBuilder extends StatefulWidget {
  final BusinessInfo data;
  const SellerBusinessInfoBuilder({Key key, this.data}) : super(key: key);

  @override
  _SellerBusinessInfoBuilderState createState() =>
      _SellerBusinessInfoBuilderState();
}

class _SellerBusinessInfoBuilderState extends State<SellerBusinessInfoBuilder> {
  BusinessInfo businessInfo;
  final bNameCnt = TextEditingController();
  final bDesCnt = TextEditingController();

  @override
  void initState() {
    _initData();
    super.initState();
  }

  _initData() {
    if (this.widget.data != null) {
      businessInfo = this.widget.data;
    } else {
      businessInfo = BusinessInfo.init();
    }
    bDesCnt.text = businessInfo.businessDesc;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          AppTextField(
            value: businessInfo?.businessName,
            hintText: "legalBusinessName",
            isLocalise: true,
            onChange: (v) {
              businessInfo.businessName = v;
            },
          ),
          Flexible(
              child: SellerAddress(
            title: "bussinessAdd",
            address: businessInfo.businessAddress,
          )),
          SizedBox(
            height: 15,
          ),
          AppTextView(
            controller: bDesCnt,
            onChange: (v) {
              businessInfo.businessDesc = v;
            },
          ),
          //SellerStorePage(),
          ShippingSettings(
            setting: businessInfo.shippingSetting,
          ),
          if (this.widget.data == null)
            AppRoundButton(
                title: "continue", onPressed: () => this._submitPress(context))
        ],
      ),
    );
  }

  _submitPress(context) {
    final error = businessInfo.validate();
    if (error == null) {
      final id = SellerSignupParent.of(context).data.sellerId;
      BlocProvider.of<SellerSignupBloc>(context)
          .add(AddBusinessInfoEvent(businessInfo: businessInfo, sellerId: id));
    } else {
      AppAlert.showAlert(title: "Error", message: error, context: context);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
