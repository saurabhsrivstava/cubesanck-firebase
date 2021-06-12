import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/CommonViews/Navbar.dart';
import 'package:cubesnack/Constants/AppEnums.dart';
import 'package:cubesnack/Screens/Authentication/FreeLancer/Pages/FrPaymentInfoPage.dart';
import 'package:cubesnack/Screens/Authentication/FreeLancer/Pages/FrPersonaInfoPage.dart';
import 'package:cubesnack/Screens/Authentication/FreeLancer/Pages/FrSignupParentPage.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Pages/SellerProgressBar.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/SellerSignupPage.dart';
import 'package:cubesnack/Utils/UserSession.dart';
import 'package:cubesnack/Utils/Util.dart';
import 'package:flutter/material.dart';

class FrSignupPage extends StatefulWidget {
  const FrSignupPage({Key key}) : super(key: key);

  @override
  _FrSignupPageState createState() => _FrSignupPageState();
}

class _FrSignupPageState extends State<FrSignupPage> {
  Widget _currentStep = FrPaymentInfoPage(); //FrPersonalInfoPage();
  List<SellerSignupProgressData> data = [
    SellerSignupProgressData(
        title: "Personnal\nInformation",
        status: SellerSignupProgressStatus.filling),
    SellerSignupProgressData(
        title: "Professional\nInformation",
        status: SellerSignupProgressStatus.notVisited),
    SellerSignupProgressData(
        title: "Payment\nInformation",
        status: SellerSignupProgressStatus.notVisited),
    SellerSignupProgressData(
        title: "Account\nSecurity",
        status: SellerSignupProgressStatus.notVisited),
  ];

  @override
  void initState() {
    _currentStep = _getCurrentPage();
    super.initState();
  }

  _getCurrentPage() {
    if (UserSession.shared.lastFreelancerStep == null) {
      return FrPersonalInfoPage();
    } else {
      FrSignupSteps step =
          FrSignupSteps.values[UserSession.shared.lastFreelancerStep];
      for (var i = 0; i < step.index; i++) {
        data[i].status = SellerSignupProgressStatus.filled;
      }
      return step.getPage(_stepChanged);
    }
  }

  @override
  Widget build(BuildContext context) {
    FrSignupParentPage.of(context).data.stepCallBack = _stepChanged;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: white,
        title: AppTitle(
          title: "freelancerSignup",
          fontSize: 32,
          isLocalised: true,
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: <Widget>[
            SellerProgressBar(
              data: data,
              dividerCount: 5,
            ),
            Expanded(
              child: SingleChildScrollView(child: _currentStep),
            ),
          ],
        ),
      ),
    );
  }

  _stepChanged(FrSignupSteps step) {
    appPrint(step.index);
    UserSession.shared.lastFreelancerStep = step.index;
    this.setState(() {
      data[step.index - 1].status = SellerSignupProgressStatus.filled;
      data[step.index].status = SellerSignupProgressStatus.filling;
      _currentStep = step.getPage(_stepChanged);
    });
  }
}
