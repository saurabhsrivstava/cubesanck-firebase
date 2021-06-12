import 'package:cubesnack/CommonViews/AppWebView.dart';
import 'package:cubesnack/Screens/Authentication/FreeLancer/Pages/FrAccountInfoPage.dart';
import 'package:cubesnack/Screens/Authentication/FreeLancer/Pages/FrAccountSecurityPage.dart';
import 'package:cubesnack/Screens/Authentication/FreeLancer/Pages/FrPaymentInfoPage.dart';
import 'package:cubesnack/Screens/Authentication/FreeLancer/Pages/FrPersonaInfoPage.dart';
import 'package:cubesnack/Screens/Authentication/FreeLancer/Pages/FrProfessionalInfoPage.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Pages/BusinessInfo/SellerBusinessInfoPage.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Pages/PaymentInfo/SellerPaymentInfoPage.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Pages/PersonalInfo/SellerPersonalInfoPage.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Pages/TaxInfo/SellerTaxInfoPage.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Stores/ViewEditStore/SellerViewEditStore.dart';
import 'package:cubesnack/Screens/Gig/Pages/AddGigDetailPage.dart';
import 'package:cubesnack/Screens/Gig/Pages/AddGigFAQPage.dart';
import 'package:cubesnack/Screens/Gig/Pages/AddGigPhotoGalleryPage.dart';
import 'package:cubesnack/Screens/Gig/Pages/AddGigScopePage.dart';
import 'package:cubesnack/Screens/Listing/AddListing/Bloc/index.dart';
import 'package:cubesnack/Screens/Listing/AddListing/PriceAndVariations/Pages/PriceAndVariationsPage.dart';
import 'package:cubesnack/Screens/Listing/AddListing/ProductDetails/ProductDetailPage.dart';
import 'package:cubesnack/Screens/Listing/AddListing/PromoteListing/PromoteListingPage.dart';
import 'package:cubesnack/Screens/Listing/AddListing/SellerAddListingPage.dart';
import 'package:cubesnack/Screens/Listing/AddListing/ShippingAndDelivery/ShippingAndDeliveryPage.dart';
import 'package:cubesnack/Screens/Listing/AddListing/TNC/TNCPage.dart';
import 'package:cubesnack/Screens/Routes/AppRoutes.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';

enum PageMode { view, edit, select }
enum UserRoles { buyer, seller, freelancer }
enum CartDelivery {
  home,
  store,
  fastShipping,
}
enum GroupCheckType { horizontal, vertcle }

enum SellerSignupProgressStatus { filled, filling, notVisited }
enum SellerSignupSteps {
  personalInfo,
  businessInfo,
  storeInfo,
  taxesInfo,
  paymentInfo
}

extension SellerSignupStepsExt on SellerSignupSteps {
  getPage(Function callBack) {
    switch (this) {
      case SellerSignupSteps.personalInfo:
        return SellerPersonalInfoPage();
      case SellerSignupSteps.businessInfo:
        return SellerBusinessInfoPage();
      case SellerSignupSteps.storeInfo:
        return SellerViewEditStore();
      case SellerSignupSteps.taxesInfo:
        return SellerTaxInfoPage();
      case SellerSignupSteps.paymentInfo:
        return SellerPaymentInfoPage();
    }
  }
}

enum AddGigSteps { gigDetail, scope, faq, photoGallery }

extension AddGigStepsExt on AddGigSteps {
  getPage(Function callBack) {
    switch (this) {
      case AddGigSteps.gigDetail:
        return AddGigDetailPage();
      case AddGigSteps.scope:
        return AddGigScopePage();
      case AddGigSteps.faq:
        return AddGigFAQPage();
      case AddGigSteps.photoGallery:
        return AddGigPhotoGalleryPage();
    }
  }
}

enum FrSignupSteps {
  personalInfo,
  professionalInfo,
  paymentInfo,
  accountSecurity
}

extension FrSignupStepsExt on FrSignupSteps {
  getPage(Function callBack) {
    switch (this) {
      case FrSignupSteps.personalInfo:
        return FrPersonalInfoPage();
      case FrSignupSteps.professionalInfo:
        return FrProfessionalInfoPage();
      case FrSignupSteps.paymentInfo:
        return FrPaymentInfoPage();
      case FrSignupSteps.accountSecurity:
        return FrAccountInfoPage();
    }
  }
}

enum SocialType { apple, gmail, facebook }

extension SocialTypeExt on SocialType {
  SocialLogo getData() {
    switch (this) {
      case SocialType.apple:
        return SocialLogo(
            name: "Login with Apple Id",
            backgroundColor: Colors.black,
            icon: "assets/signup/appleLogo.svg");
      case SocialType.gmail:
        return SocialLogo(
            name: "Login with Gmail",
            backgroundColor: AppColors.gmailBlue,
            icon: "assets/signup/googleLogo.svg");
      case SocialType.facebook:
        return SocialLogo(
            name: "Login with Facebook",
            backgroundColor: AppColors.fbBlue,
            icon: "assets/signup/facebookLogo.svg");
    }
  }
}

class SocialLogo {
  String name;
  String icon;
  Color backgroundColor;
  SocialLogo({this.name, this.icon, this.backgroundColor});
}

enum SellerAddListingSteps {
  productDetails,
  priceVariation,
  shippingAndDelivery,
  tAndC,
  promoteListing
}

extension SellerAddListingStepsExt on SellerAddListingSteps {
  getPage(Function callBack) {
    switch (this) {
      case SellerAddListingSteps.productDetails:
        return ProductDetailPage();
      case SellerAddListingSteps.priceVariation:
        return PriceAndVariationsPage();
      case SellerAddListingSteps.shippingAndDelivery:
        return ShippingAndDeliveryPage();
      case SellerAddListingSteps.tAndC:
        return TNCPage();
      case SellerAddListingSteps.promoteListing:
        return PromoteListingPage();
    }
  }
}

enum MyAccount {
  setting,
  paymentAndBilling,
  manageOrders,
  deliveryAddresses,
  notification,
  browseHistory,
  favorite
}

extension MyAccountExt on MyAccount {
  title() {
    switch (this) {
      case MyAccount.setting:
        return "Account Settings";
      case MyAccount.paymentAndBilling:
        return "Payment and Billig";

      case MyAccount.manageOrders:
        return "Manage Orders";

      case MyAccount.deliveryAddresses:
        return "Delivery Addresses";

      case MyAccount.notification:
        return "Notification";

      case MyAccount.browseHistory:
        return "Browsing history";

      case MyAccount.favorite:
        return "Favorite";
    }
  }

  icon() {
    switch (this) {
      case MyAccount.setting:
        return Icon(Icons.person);
      case MyAccount.paymentAndBilling:
        return Icon(Icons.payment);

      case MyAccount.manageOrders:
        return Icon(Icons.reorder);

      case MyAccount.deliveryAddresses:
        return Icon(Icons.local_shipping_outlined);

      case MyAccount.notification:
        return Icon(Icons.change_history_outlined);

      case MyAccount.browseHistory:
        return Icon(Icons.history);

      case MyAccount.favorite:
        return Icon(Icons.favorite_border);
    }
  }

  showDetails(context) {
    switch (this) {
      case MyAccount.setting:
        Navigator.pushNamed(context, AppRoutes.accountSetting);
        break;
      case MyAccount.paymentAndBilling:
        Navigator.pushNamed(context, AppRoutes.cardList);
        return "Payment and Billig";

      case MyAccount.manageOrders:
        Navigator.pushNamed(context, AppRoutes.buyerOrdersList);
        break;

      case MyAccount.deliveryAddresses:
        Navigator.pushNamed(context, AppRoutes.deliveryAddress);
        break;

      case MyAccount.notification:
        return "Notification";

      case MyAccount.browseHistory:
        Navigator.pushNamed(context, AppRoutes.browsingHistory);
        break;

      case MyAccount.favorite:
        Navigator.pushNamed(context, AppRoutes.favourite);
        break;
    }
  }
}

enum AboutAppEnum {
  privacyPolicy,
  faq,
  legalInformation,
  rateApp,
  helpUsImprove,
}

extension AboutAppEnumExt on AboutAppEnum {
  title() {
    switch (this) {
      case AboutAppEnum.privacyPolicy:
        return "Privacy Policy";
      case AboutAppEnum.faq:
        return "frequently ask questions";

      case AboutAppEnum.legalInformation:
        return "Legal Information";

      case AboutAppEnum.rateApp:
        return "Rate Our App";

      case AboutAppEnum.helpUsImprove:
        return "Help us Improve";
    }
  }

  icon() {
    switch (this) {
      case AboutAppEnum.privacyPolicy:
        return Icon(Icons.privacy_tip);
      case AboutAppEnum.faq:
        return Icon(Icons.https);

      case AboutAppEnum.legalInformation:
        return Icon(Icons.help_outlined);

      case AboutAppEnum.rateApp:
        return Icon(Icons.star_border);

      case AboutAppEnum.helpUsImprove:
        return Icon(Icons.self_improvement_outlined);
    }
  }

  showDetails(context) {
    switch (this) {
      case AboutAppEnum.privacyPolicy:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AppWebView(
                      url:
                          "https://firebasestorage.googleapis.com/v0/b/cubesnack-1611124943460.appspot.com/o/PrivacyPolicy.pdf?alt=media&token=db4a7e87-643c-4799-b9d8-ac32e959a983",
                      title: this.title(),
                    )));

        break;
      case AboutAppEnum.faq:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AppWebView(
                    url:
                        "https://firebasestorage.googleapis.com/v0/b/cubesnack-1611124943460.appspot.com/o/Cubesnack-FAQs%20v2.pdf?alt=media&token=e74a9bd9-8566-4dca-b07f-c374c1e39e83",
                    title: this.title())));
        break;
      case AboutAppEnum.legalInformation:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AppWebView(
                    url: "https://www.cubesnack.com/terms-of-use",
                    title: this.title())));
        break;

      case AboutAppEnum.rateApp:
        // Navigator.pushNamed(context, AppRoutes.deliveryAddress);
        break;

      case AboutAppEnum.helpUsImprove:
        return "Notification";
    }
  }
}

enum VenderManagementEnum {
  //vendorAccountSetting,
  addProduuct,
  manageListing,
  paymentInformation,
  manageOrder,
  bussinessInformation,
  shippingAndReturnInfo,
  notificationPreference,
  manageStore,
  //sellerPayout
}

extension VenderManagementEnumExt on VenderManagementEnum {
  title() {
    switch (this) {
      // case VenderManagementEnum.vendorAccountSetting:
      //   return "Vender Account Settings";
      case VenderManagementEnum.addProduuct:
        return "Add Product";

      case VenderManagementEnum.manageListing:
        return "Manage Listing";

      // case VenderManagementEnum.manageInventory:
      //   return "Manage Inventory";

      case VenderManagementEnum.paymentInformation:
        return "Payment Information";

      case VenderManagementEnum.manageOrder:
        return "Manage Order";
      case VenderManagementEnum.shippingAndReturnInfo:
        return "Manage Returns";

      case VenderManagementEnum.notificationPreference:
        return "Notification Preference";
      case VenderManagementEnum.bussinessInformation:
        return "Bussiness Information";
      case VenderManagementEnum.manageStore:
        return "Manage Store";
      // case VenderManagementEnum.sellerPayout:
      //   return "Seller Payout";
    }
  }

  icon() {
    switch (this) {
      // case VenderManagementEnum.vendorAccountSetting:
      //   return Icon(Icons.person);
      case VenderManagementEnum.addProduuct:
        return Icon(Icons.add_circle_outline);

      case VenderManagementEnum.manageListing:
        return Icon(Icons.store_mall_directory_outlined);

      // case VenderManagementEnum.manageInventory:
      //   return Icon(Icons.reorder);

      // case VenderManagementEnum.promoteListing:
      //   return Icon(Icons.star_border);

      case VenderManagementEnum.paymentInformation:
        return Icon(Icons.monetization_on_outlined);

      case VenderManagementEnum.manageOrder:
        return Icon(Icons.view_list_outlined);
      case VenderManagementEnum.shippingAndReturnInfo:
        return Icon(Icons.local_shipping_outlined);

      case VenderManagementEnum.notificationPreference:
        return Icon(Icons.notification_important_outlined);
      case VenderManagementEnum.bussinessInformation:
        return Icon(Icons.error_outline_outlined);
      case VenderManagementEnum.manageStore:
        return Icon(Icons.reorder);
      // case VenderManagementEnum.sellerPayout:
      //   return Icon(Icons.monetization_on_outlined);
    }
  }

  showDetails(BuildContext context) {
    switch (this) {
      // case VenderManagementEnum.vendorAccountSetting:
      //   return "Vender Account Settings";
      case VenderManagementEnum.addProduuct:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SellerAddListingParent(
                      child: SellerAddListingPage(),
                      data: AddListingData(),
                      bloc: AddListingBloc(ListingDefaultState()),
                    )));
        break;

      case VenderManagementEnum.manageListing:
        Navigator.pushNamed(context, AppRoutes.allListing);
        break;

      // case VenderManagementEnum.manageInventory:
      //   return "Manage Inventory";

      // case VenderManagementEnum.promoteListing:
      //   return "Promote Listing";

      case VenderManagementEnum.paymentInformation:
        Navigator.pushNamed(context, AppRoutes.cardList);

        return "Payment Information";

      case VenderManagementEnum.manageOrder:
        Navigator.pushNamed(context, AppRoutes.manageSellerOrder);
        break;
      case VenderManagementEnum.shippingAndReturnInfo:
        Navigator.pushNamed(context, AppRoutes.sellerReturnInfo);
        break;
      case VenderManagementEnum.notificationPreference:
        return "otification Preference";
      case VenderManagementEnum.bussinessInformation:
        Navigator.pushNamed(context, AppRoutes.businnessInfo);
        break;
      case VenderManagementEnum.manageStore:
        Navigator.pushNamed(context, AppRoutes.manageStore);
        break;

      //case VenderManagementEnum.sellerPayout:
      //Navigator.pushNamed(context, AppRoutes.sellerPayout);
    }
  }
}

extension StringToInt on String {
  int toInt() {
    return int.parse(this);
  }
}

enum FilterType { category, store, status }

extension FilterTypeExt on FilterType {
  code() {
    switch (this) {
      case FilterType.category:
        return "categories=";

      case FilterType.store:
        return "stores=";

      case FilterType.status:
        return "status=";
    }
  }
}
