import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/CommonViews/Navbar.dart';
import 'package:cubesnack/Constants/AppEnums.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Pages/PersonalInfo/SellerPersonalInfoPage.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Pages/SellerProgressBar.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Stores/AddStore/SellerAddStorePage.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Stores/ViewEditStore/SellerViewEditStore.dart';
import 'package:cubesnack/Tabbar/Account/Views/SellerBusinessInfo.dart';
import 'package:cubesnack/Utils/TokenManager.dart';
import 'package:cubesnack/Utils/UserSession.dart';
import 'package:cubesnack/Utils/Util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'Bloc/index.dart';
import 'Pages/BusinessInfo/SellerBusinessInfoPage.dart';

class SellerSignupPage extends StatefulWidget {
  final bool isBack;
  const SellerSignupPage({Key key, this.isBack}) : super(key: key);

  @override
  _SellerSignupPageState createState() => _SellerSignupPageState();
}

class _SellerSignupPageState extends State<SellerSignupPage> {
  Widget _currentStep = SellerPersonalInfoPage();
  List<SellerSignupProgressData> data = [
    SellerSignupProgressData(
        title: "Personnal\nInformation",
        status: SellerSignupProgressStatus.filling),
    SellerSignupProgressData(
        title: "Business\nInformation",
        status: SellerSignupProgressStatus.notVisited),
    SellerSignupProgressData(
        title: "Add Store\nInformation",
        status: SellerSignupProgressStatus.notVisited),
    SellerSignupProgressData(
        title: "Taxes W-9", status: SellerSignupProgressStatus.notVisited),
    SellerSignupProgressData(
        title: "Payment\nInformation",
        status: SellerSignupProgressStatus.notVisited),
  ];

  @override
  void initState() {
    super.initState();
    _currentStep = _getCurrentPage();
  }

  _getCurrentPage() {
    if (UserSession.shared.lastSellerStep == null) {
      return SellerPersonalInfoPage();
    } else {
      SellerSignupSteps step =
          SellerSignupSteps.values[UserSession.shared.lastSellerStep];
      for (var i = 0; i < step.index; i++) {
        data[i].status = SellerSignupProgressStatus.filled;
      }
      return step.getPage(_stepChanged);
    }
  }

  @override
  Widget build(BuildContext context) {
    SellerSignupParent.of(context).data.stepCallBack = _stepChanged;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: white,
        title: AppTitle(
          title: "signup",
          fontSize: 32,
          isLocalised: true,
        ),
        leading: new IconButton(
            icon: new Icon(Icons.arrow_back_ios),
            onPressed: () async {
              TokenManager.setLastSellerStatus();
              Navigator.pop(context);
            }),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SellerProgressBar(
              data: data,
              dividerCount: 8,
            ),
            Expanded(
              child: SingleChildScrollView(child: _currentStep),
            ),
          ],
        ),
      ),
    );
  }

  _stepChanged(SellerSignupSteps step) {
    appPrint(step.index);
    UserSession.shared.lastSellerId =
        SellerSignupParent.of(context).data.sellerId;
    UserSession.shared.lastSellerStep = step.index;
    this.setState(() {
      data[step.index - 1].status = SellerSignupProgressStatus.filled;
      data[step.index].status = SellerSignupProgressStatus.filling;
      _currentStep = step.getPage(_stepChanged);
    });
  }
}

class SellerSignupParent extends InheritedWidget {
  const SellerSignupParent({
    Key key,
    @required this.data,
    @required Widget child,
  })  : assert(data != null),
        assert(child != null),
        super(key: key, child: child);

  final SignupData data;
  //final SellerSignupBloc bloc;

  static SellerSignupParent of(BuildContext context) {
    // ignore: deprecated_member_use
    return context.dependOnInheritedWidgetOfExactType<SellerSignupParent>();
  }

  @override
  bool updateShouldNotify(SellerSignupParent old) {
    return false; //data != old.data;
  }
}

class SignupData {
  Function stepCallBack;
  String sellerId = UserSession.shared.lastSellerId;
  SignupData({this.stepCallBack, this.sellerId});
}

class SellerSignupProgressData {
  final String title;
  SellerSignupProgressStatus status;
  SellerSignupProgressData({this.title, this.status});
}
