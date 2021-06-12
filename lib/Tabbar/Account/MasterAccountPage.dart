import 'package:cubesnack/CommonViews/WebNavigationBar.dart';
import 'package:cubesnack/Constants/AppEnums.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Pages/ReturnInfo/Pages/SellerReturnInfoPage.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Stores/ManageStore/ManageStorePage.dart';
import 'package:cubesnack/Screens/Listing/AddListing/Bloc/AddListing_bloc.dart';
import 'package:cubesnack/Screens/Listing/AddListing/Bloc/AddListing_state.dart';
import 'package:cubesnack/Screens/Listing/AddListing/SellerAddListingPage.dart';
import 'package:cubesnack/Screens/Listing/AllListing/AllListingPage.dart';
import 'package:cubesnack/Screens/Orders/BuyerOrders/Pages/BuyerOrderListPage.dart';
import 'package:cubesnack/Screens/Orders/SellerOrders/ManageOrder/ManageSellerOrderPage.dart';
import 'package:cubesnack/Screens/Payments/Screens/CardList/Pages/CardListPage.dart';
import 'package:cubesnack/Tabbar/Account/Screens/AccountSetting/Views/AccountSettingPage.dart';
import 'package:cubesnack/Tabbar/Account/Screens/BrowsingHistory/BrowsingHistoryPage.dart';
import 'package:cubesnack/Tabbar/Account/Screens/DeliveryAndAddress/DeliveryAddressPage.dart';
import 'package:cubesnack/Tabbar/Account/Views/AccountBuilder.dart';
import 'package:cubesnack/Tabbar/Account/Views/SellerBusinessInfo.dart';
import 'package:cubesnack/Tabbar/WishList/WebWishListPage.dart';
import 'package:cubesnack/Tabbar/WishList/WishListPage.dart';
import 'package:cubesnack/Utils/PlatformInfo.dart';
import 'package:cubesnack/Utils/UserSession.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MasterAccountPage extends StatefulWidget {
  Widget child = AccountSettingPage();

  @override
  _MasterDetailPageState createState() => _MasterDetailPageState();
}

class _MasterDetailPageState extends State<MasterAccountPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final isLoggedIn = UserSession.shared.isLoggedIn();
    return DefaultTabController(
      length: 10,
      child: Scaffold(
        appBar: WebNavigationBar(),
        body: OrientationBuilder(
          builder: (context, orientation) {
            return Container(
              margin: EdgeInsets.only(top: 15),
              padding: EdgeInsets.only(
                  left: size.height / 5, right: size.height / 5),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: AccountBuilder(
                      account: this._showDetails,
                      vender: this._showVenderDetails,
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: isLoggedIn
                        ? Container(
                            margin: EdgeInsets.only(top: 15),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey[200])),
                            child: widget.child,
                          )
                        : Container(),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  _showDetails(MyAccount type) {
    switch (type) {
      case MyAccount.setting:
        widget.child = AccountSettingPage();
        break;
      case MyAccount.paymentAndBilling:
        widget.child = CardListPage();
        break;
      case MyAccount.manageOrders:
        widget.child = BuyerOrderListPage();
        break;

      case MyAccount.deliveryAddresses:
        widget.child = DeliveryAddressPage();
        break;

      case MyAccount.notification:
        return "Notification";

      case MyAccount.browseHistory:
        widget.child = BrowsingHistoryPage();
        break;

      case MyAccount.favorite:
        widget.child = PlatformInfo.isDesktop(context)
            ? WebWishListPage()
            : WishListPage();
        break;
    }
    setState(() {});
  }

  _showVenderDetails(VenderManagementEnum type) {
    switch (type) {
      case VenderManagementEnum.addProduuct:
        widget.child = SellerAddListingParent(
          child: SellerAddListingPage(),
          data: AddListingData(),
          bloc: AddListingBloc(ListingDefaultState()),
        );
        break;

      case VenderManagementEnum.manageListing:
        widget.child = AllListingPage();
        break;

      // case VenderManagementEnum.manageInventory:
      //   return "Manage Inventory";

      // case VenderManagementEnum.promoteListing:
      //   return "Promote Listing";

      case VenderManagementEnum.paymentInformation:
        widget.child = CardListPage();
        break;

      case VenderManagementEnum.manageOrder:
        widget.child = ManageSellerOrderPage();
        break;
      case VenderManagementEnum.shippingAndReturnInfo:
        widget.child = SellerReturnInfoPage();
        break;
      case VenderManagementEnum.notificationPreference:
        break;
      case VenderManagementEnum.bussinessInformation:
        widget.child = SellerBusinessInfo();
        break;
      case VenderManagementEnum.manageStore:
        widget.child = ManageStorePage();
        break;

      //case VenderManagementEnum.sellerPayout:
      //Navigator.pushNamed(context, AppRoutes.sellerPayout);
    }
    setState(() {});
  }
}
