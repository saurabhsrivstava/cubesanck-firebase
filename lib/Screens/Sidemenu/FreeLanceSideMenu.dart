import 'package:cubesnack/Screens/Authentication/SellerSignup/SellerSignupPage.dart';
import 'package:cubesnack/Screens/Gig/AddGigParentContainer.dart';
import 'package:cubesnack/Screens/Gig/GigSignupPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'SideMenuRow.dart';

class FreeLanceSideMenu extends StatelessWidget {
  const FreeLanceSideMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SideMenuRow(
            title: "myProfile",
            icon: Icons.home,
            callBack: this._myProfile,
          ),
          SideMenuRow(
            title: "addAGig",
            icon: Icons.view_list_outlined,
            callBack: this._addGig,
          ),
          SideMenuRow(
            title: "manageGig",
            icon: Icons.shopping_bag_outlined,
            callBack: this._manageGig,
          ),
          SideMenuRow(
            title: "shareMyGig",
            icon: Icons.shopping_bag_outlined,
            callBack: this._shareMyGig,
          ),
          SideMenuRow(
            title: "earnings",
            icon: Icons.shopping_bag_outlined,
            callBack: this._earnings,
          ),
          SideMenuRow(
            title: "managePaymentRequest",
            icon: Icons.shopping_bag_outlined,
            callBack: this._managePayment,
          ),
        ],
      ),
    );
  }

  _myProfile(context) {}

  _addGig(context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              AddGigParentContainer(child: GigSignupPage(), data: SignupData()),
        ));
  }

  _earnings(context) {}

  _manageGig(context) {}

  _shareMyGig(context) {}

  _managePayment(context) {}
}
