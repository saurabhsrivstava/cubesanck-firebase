import 'package:cubesnack/CommonViews/AppRoundButton.dart';
import 'package:cubesnack/CommonViews/AppTextField.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Bloc/index.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Pages/BusinessInfo/Models/BusinessInfo.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Views/SellerAddress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../SellerSignupPage.dart';

class SellerTaxInfoBuilder extends StatefulWidget {
  const SellerTaxInfoBuilder({Key key}) : super(key: key);

  @override
  _SellerTaxInfoBuilderState createState() => _SellerTaxInfoBuilderState();
}

class _SellerTaxInfoBuilderState extends State<SellerTaxInfoBuilder> {
  @override
  void initState() {
    super.initState();
  }

  TaxInfo taxInfo = TaxInfo.init();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          AppTextField(
            hintText: "name",
            topMargin: 5,
            isLocalise: true,
            onChange: (v) {
              taxInfo.name = v;
            },
          ),
          AppTextField(
            hintText: "businessName",
            topMargin: 5,
            isLocalise: true,
            onChange: (v) {
              taxInfo.businessName = v;
            },
          ),
          Flexible(
              child: SellerAddress(
            title: 'address',
            address: taxInfo.address,
          )),
          SizedBox(
            height: 15,
          ),
          AppTextField(
            hintText: "taxId",
            isLocalise: true,
            onChange: (v) {
              taxInfo.taxId = v;
            },
          ),
          AppRoundButton(
              margin: 20,
              title: "continue",
              onPressed: () {
                final id = SellerSignupParent.of(context).data.sellerId;
                BlocProvider.of<SellerSignupBloc>(context)
                    .add(AddTaxInfoEvent(taxInfo: taxInfo, sellerId: id));
              }
              //SellerSignupParent.of(context)
              //     .data
              //     .stepCallBack(SellerSignupSteps.paymentInfo),
              )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
