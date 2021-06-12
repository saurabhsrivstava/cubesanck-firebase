import 'package:cubesnack/Constants/AppEnums.dart';
import 'package:cubesnack/Screens/Authentication/FreeLancer/Models/MAccountSec.dart';
import 'package:cubesnack/Screens/Authentication/FreeLancer/Models/MPaymentInfo.dart';
import 'package:cubesnack/Screens/Authentication/FreeLancer/Views/FrAccountSecurityView.dart';
import 'package:flutter/material.dart';

import 'FrSignupParentPage.dart';

class FrAccountSecurityPage extends StatefulWidget {
  final Function submit;
  const FrAccountSecurityPage({Key key, this.submit}) : super(key: key);

  @override
  _FrAccountSecurityPageState createState() => _FrAccountSecurityPageState();
}

class _FrAccountSecurityPageState extends State<FrAccountSecurityPage> {
  final digit1 = TextEditingController();
  final digit2 = TextEditingController();
  final digit3 = TextEditingController();
  final digit4 = TextEditingController();
  final digit5 = TextEditingController();
  final digit6 = TextEditingController();
  MAccountSec account;
  MPaymentInfo info;
  @override
  void initState() {
    account = MAccountSec();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FcAccountSecurityView(
        controllers: [digit1, digit2, digit3, digit4, digit5, digit6],
        nextPress: () => _nextPressed(),
        account: account,
      ),
    );
  }

  _nextPressed() {
    FrSignupParentPage.of(context)
        .data
        .stepCallBack(FrSignupSteps.accountSecurity);
  }
}
