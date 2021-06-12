import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/CommonViews/Navbar.dart';
import 'package:cubesnack/Constants/AppEnums.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Pages/SellerProgressBar.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/SellerSignupPage.dart';
import 'package:cubesnack/Screens/Gig/AddGigParentContainer.dart';
import 'package:cubesnack/Screens/Gig/Pages/AddGigDetailPage.dart';
import 'package:cubesnack/Utils/UserSession.dart';
import 'package:cubesnack/Utils/Util.dart';
import 'package:flutter/material.dart';

class GigSignupPage extends StatefulWidget {
  GigSignupPage({Key key}) : super(key: key);

  @override
  _GigSignupPageState createState() => _GigSignupPageState();
}

class _GigSignupPageState extends State<GigSignupPage> {
  Widget _currentStep = AddGigDetailPage();
  List<SellerSignupProgressData> data = [
    SellerSignupProgressData(
        title: "GigDetail", status: SellerSignupProgressStatus.filling),
    SellerSignupProgressData(
        title: "Scope\n&Pricing",
        status: SellerSignupProgressStatus.notVisited),
    SellerSignupProgressData(
        title: "Description\nFAQ",
        status: SellerSignupProgressStatus.notVisited),
    SellerSignupProgressData(
        title: "Photo\nGallery", status: SellerSignupProgressStatus.notVisited),
  ];

  @override
  void initState() {
    _currentStep = _getCurrentPage();
    super.initState();
  }

  _getCurrentPage() {
    if (UserSession.shared.lastFreelancerStep == null) {
      return AddGigDetailPage();
    } else {
      AddGigSteps step =
          AddGigSteps.values[UserSession.shared.lastFreelancerStep];
      for (var i = 0; i < step.index; i++) {
        data[i].status = SellerSignupProgressStatus.filled;
      }
      return step.getPage(_stepChanged);
    }
  }

  @override
  Widget build(BuildContext context) {
    AddGigParentContainer.of(context).data.stepCallBack = _stepChanged;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: white,
        title: AppTitle(
          title: "Add Gig",
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
              dividerCount: 4,
            ),
            Expanded(
              child: SingleChildScrollView(child: _currentStep),
            ),
          ],
        ),
      ),
    );
  }

  _stepChanged(AddGigSteps step) {
    appPrint(step.index);
    // UserSession.shared.lastFreelancerStep = step.index;
    this.setState(() {
      data[step.index - 1].status = SellerSignupProgressStatus.filled;
      data[step.index].status = SellerSignupProgressStatus.filling;
      _currentStep = step.getPage(_stepChanged);
    });
  }
}
