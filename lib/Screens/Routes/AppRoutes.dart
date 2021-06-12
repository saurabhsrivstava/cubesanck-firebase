import 'package:cubesnack/Screens/Authentication/Authentication.dart';
import 'package:cubesnack/Screens/Authentication/Login/LoginPage.dart';
import 'package:cubesnack/Screens/Authentication/OTP/OTPPage.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Pages/BusinessInfo/SellerBusinessInfoPage.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Pages/ReturnInfo/Pages/SellerReturnInfoPage.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Pages/SellerIntroPage.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Pages/PersonalInfo/SellerPersonalInfoPage.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Stores/AllStores/Pages/AllStoresGridPage.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Stores/ManageStore/ManageStorePage.dart';
import 'package:cubesnack/Screens/Cart/Bloc/index.dart';
import 'package:cubesnack/Screens/Cart/Pages/CartPage.dart';
import 'package:cubesnack/Screens/Cart/Pages/CartPrentContainer.dart';
import 'package:cubesnack/Screens/Cart/Pages/CartWebPage.dart';
import 'package:cubesnack/Screens/Listing/AddListing/SellerAddListingPage.dart';
import 'package:cubesnack/Screens/Listing/AllListing/AllListingPage.dart';
import 'package:cubesnack/Screens/Orders/BuyerOrders/Pages/BuyerOrderListPage.dart';
import 'package:cubesnack/Screens/Orders/SellerOrders/ManageOrder/ManageSellerOrderPage.dart';
import 'package:cubesnack/Screens/Payments/Screens/CardList/Pages/CardListPage.dart';
import 'package:cubesnack/Screens/Reviews/Pages/WriteReviewPage.dart';
import 'package:cubesnack/Screens/SellerPayout/Pages/SellerPayoutPage.dart';
import 'package:cubesnack/Tabbar/Account/Screens/AccountSetting/Views/AccountSettingPage.dart';
import 'package:cubesnack/Tabbar/Account/Screens/BrowsingHistory/BrowsingHistoryPage.dart';
import 'package:cubesnack/Tabbar/Account/Screens/DeliveryAndAddress/AddNewAddressPage.dart';
import 'package:cubesnack/Tabbar/Account/Screens/DeliveryAndAddress/DeliveryAddressPage.dart';
import 'package:cubesnack/Tabbar/Account/Views/SellerBusinessInfo.dart';
import 'package:cubesnack/Tabbar/Home/Categories/CategoryDetailPage.dart';
import 'package:cubesnack/Tabbar/Home/Categories/CategoryDetailWebPage.dart';
import 'package:cubesnack/Tabbar/Home/HomePage.dart';
import 'package:cubesnack/Tabbar/Search/SearchPage.dart';
import 'package:cubesnack/Tabbar/WishList/WebWishListPage.dart';
import 'package:cubesnack/Tabbar/WishList/WishListPage.dart';
import 'package:cubesnack/Utils/PlatformInfo.dart';

Map getRoutes() {
  return {
    '/': (context) => Authentication(),
    AppRoutes.sellerIntro: (context) => SellerIntroPage(),
    AppRoutes.sellerPersonalInfo: (context) => SellerPersonalInfoPage(),
    AppRoutes.sellerBusinessInfo: (context) => SellerBusinessInfoPage(),
    AppRoutes.addListing: (context) => SellerAddListingPage(),
    AppRoutes.allListing: (context) => AllListingPage(),
    AppRoutes.manageStore: (context) => ManageStorePage(),
    AppRoutes.home: (context) => HomePage(),
    AppRoutes.categoryDetailList: (context) => PlatformInfo.isDesktop(context)
        ? CategoryDetailWebPage()
        : CategoryDetailPage(),
    AppRoutes.browsingHistory: (context) => BrowsingHistoryPage(),
    AppRoutes.favourite: (context) => PlatformInfo.isDesktop(context)
        ? WebWishListPage()
        : WishListPage(),
    AppRoutes.deliveryAddress: (context) => DeliveryAddressPage(),
    AppRoutes.otpScreen: (context) => OTPPage(),
    AppRoutes.accountSetting: (context) => AccountSettingPage(),
    AppRoutes.businnessInfo: (context) => SellerBusinessInfo(),
    AppRoutes.sellerReturnInfo: (context) => SellerReturnInfoPage(),
    AppRoutes.manageSellerOrder: (context) => ManageSellerOrderPage(),
    AppRoutes.buyerOrdersList: (context) => BuyerOrderListPage(),
    AppRoutes.allStores: (context) => AllStoresGridPage(),
    AppRoutes.cart: (context) => CartPrentContainer(
        data: CartParentData(bloc: CartBloc(CartDefaultState())),
        child: PlatformInfo.isDesktop(context) ? CartWebPage() : CartPage()),
    AppRoutes.addNewAddress: (context) => AddNewAddressPage(),
    AppRoutes.cardList: (context) => CardListPage(),
    AppRoutes.search: (context) => SearchPage(),
    AppRoutes.sellerPayout: (context) => SellerPayoutPage(),
    AppRoutes.productReview: (context) => WriteReviewPage(),
    AppRoutes.login: (context) => LoginPage(),
  };
}

class AppRoutes {
  static final sellerIntro = "/seller_intro_page";
  static final sellerPersonalInfo = "/seller_personal_info";
  static final sellerBusinessInfo = "/seller_business_info";
  static final addListing = "/add_listing";
  static final allListing = "/all_listing";
  static final manageStore = "/manage_store";
  static final home = "/home";
  static final categoryDetailList = "/categoryDetailList";
  static final browsingHistory = "/browsingHistory";
  static final favourite = "/favourite";
  static final deliveryAddress = "/deliveryAddress";
  static final otpScreen = "otp_screen";
  static final accountSetting = "/account_setting";
  static final businnessInfo = "/business_info";
  static final sellerReturnInfo = "/seller_return_info";
  static final manageSellerOrder = "/manage_seller_order";
  static final buyerOrdersList = "/buyer_orders_list";
  static final allStores = "/all-stores";
  static final cart = "/cart";
  static final addNewAddress = "/add-new-address";
  static final cardList = "/cardList";
  static final search = "/search";
  static final sellerPayout = "/seller_payout";
  static final productReview = "/product_review";
  static final login = "/login";
}
