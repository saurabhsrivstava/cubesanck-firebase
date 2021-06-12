import 'package:cubesnack/CommonViews/AppLoader.dart';
import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/CommonViews/Navbar.dart';
import 'package:cubesnack/Constants/AppEnums.dart';
import 'package:cubesnack/Constants/AppExtensions.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Pages/SellerProgressBar.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/SellerSignupPage.dart';
import 'package:cubesnack/Screens/Listing/AddListing/Bloc/index.dart';
import 'package:cubesnack/Screens/Listing/AddListing/ProductDetails/ProductDetailPage.dart';
import 'package:cubesnack/Utils/TokenManager.dart';
import 'package:cubesnack/Utils/UserSession.dart';
import 'package:cubesnack/Utils/Util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SellerAddListingPage extends StatefulWidget {
  const SellerAddListingPage({Key key}) : super(key: key);

  @override
  _SellerAddListingPageState createState() => _SellerAddListingPageState();
}

class _SellerAddListingPageState extends State<SellerAddListingPage> {
  Widget _currentStep = ProductDetailPage();
  List<SellerSignupProgressData> data = [
    SellerSignupProgressData(
        title: "Product\nDetails", status: SellerSignupProgressStatus.filling),
    SellerSignupProgressData(
        title: "Price&\nVariations",
        status: SellerSignupProgressStatus.notVisited),
    SellerSignupProgressData(
        title: "Shipping and\nDelivery",
        status: SellerSignupProgressStatus.notVisited),
    SellerSignupProgressData(
        title: "Terms And\nConditions",
        status: SellerSignupProgressStatus.notVisited),
    SellerSignupProgressData(
        title: "Promote your\nListing",
        status: SellerSignupProgressStatus.notVisited),
  ];

  @override
  void initState() {
    _currentStep = _getCurrentPage();
    super.initState();
  }

  _getCurrentPage() {
    if (UserSession.shared.productStep == null) {
      return ProductDetailPage();
    } else {
      SellerAddListingSteps step =
          SellerAddListingSteps.values[UserSession.shared.productStep];
      for (var i = 0; i < step.index; i++) {
        data[i].status = SellerSignupProgressStatus.filled;
      }
      return step.getPage(_stepChanged);
    }
  }

  @override
  Widget build(BuildContext context) {
    SellerAddListingParent.of(context).data.stepCallBack = _stepChanged;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: white,
        title: AppTitle(
          title: "addListing",
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
          children: <Widget>[
            SellerProgressBar(
              data: data,
              dividerCount: 8,
            ),
            Expanded(
                child: BlocBuilder(
              builder: (context, state) {
                return Stack(
                  children: [
                    SingleChildScrollView(child: _currentStep),
                    if (state is ListingLoadingState) AppLoader()
                  ],
                );
              },
              cubit: SellerAddListingParent.of(context).bloc,
            )),
          ],
        ),
      ),
    );
  }

  _stepChanged(SellerAddListingSteps step) {
    appPrint(step.index);
    UserSession.shared.productStep = step.index;
    this.setState(() {
      data[step.index - 1].status = SellerSignupProgressStatus.filled;
      data[step.index].status = SellerSignupProgressStatus.filling;
      _currentStep = step.getPage(_stepChanged);
    });
  }
}

class SellerAddListingParent extends InheritedWidget {
  final AddListingBloc bloc;
  const SellerAddListingParent(
      {Key key,
      @required this.data,
      @required Widget child,
      @required this.bloc})
      : assert(data != null),
        assert(child != null),
        super(key: key, child: child);

  final AddListingData data;
  static SellerAddListingParent of(BuildContext context) {
    // ignore: deprecated_member_use
    return context.dependOnInheritedWidgetOfExactType<SellerAddListingParent>();
  }

  @override
  bool updateShouldNotify(SellerSignupParent old) {
    return data != old.data;
  }
}

class AddListingData {
  Function stepCallBack;
  AddListingData();
  String productId = UserSession.shared.productId;
  String categoryId = UserSession.shared.category;
}

class SellerAddListingProgressData {
  final String title;
  SellerSignupProgressStatus status;
  SellerAddListingProgressData({this.title, this.status});
}
