import 'dart:convert';

import 'package:cubesnack/Constants/AppEnums.dart';
import 'package:cubesnack/Constants/Constants.dart';
import 'package:cubesnack/Utils/UserSession.dart';
import 'package:cubesnack/Utils/Util.dart';
import 'package:http/http.dart' as http;
import 'ApiBase.dart';
import 'ApiResponse.dart';

class AppApi extends ApiBase {
  static final AppApi _shared = AppApi._internal();
  factory AppApi() {
    return _shared;
  }
  AppApi._internal();

  sendLogin(body) async {
    try {
      var uri = Uri.parse(BASE_URL + LOGIN);
      var request = http.MultipartRequest('POST', uri)..fields.addAll(body);
      var response = await request.send();
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        final respStr = await response.stream.bytesToString();
        final data = json.decode(respStr);
        final finalResponse = ApiResponse.complete(data);
        return finalResponse;
      } else {
        final respStr = await response.stream.bytesToString();
        final data = json.decode(respStr);
        final finalResponse = ApiResponse.error(data["detail"]);
        return finalResponse;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  signup(body) async {
    try {
      APIServiceManager api = APIServiceManager(USER_SIGNUP);
      ApiResponse response = await api.post(body);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  googleSignIn(body) async {
    try {
      APIServiceManager api = APIServiceManager(GOOGLE_SIGNIN);
      ApiResponse response = await api.post(body);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  facebookLogin(body) async {
    try {
      APIServiceManager api = APIServiceManager(FACEBOOK_SIGNIN);
      ApiResponse response = await api.post(body);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  addSellerPersonalInfo(body) async {
    try {
      APIServiceManager api = APIServiceManager(CREATE_SELLER);
      ApiResponse response = await api.post(body);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  addSellerBusinessInfo({body, sellerId}) async {
    try {
      final url = CREATE_SELLER + "$sellerId" + "/buisness_unit";
      APIServiceManager api = APIServiceManager(url);
      ApiResponse response = await api.post(body);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  getSellerBusinessInfo() async {
    try {
      final url = CREATE_SELLER + "buisness_unit";
      APIServiceManager api = APIServiceManager(url);
      ApiResponse response = await api.get();
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  addSellerTaxInfo({body, sellerId}) async {
    try {
      final url = CREATE_SELLER + "buisness_unit/" "$sellerId" + "/tax_info";
      APIServiceManager api = APIServiceManager(url);
      ApiResponse response = await api.post(body);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  addStore({body, bId}) async {
    try {
      final url = ADD_STORE + "$bId/store";
      APIServiceManager api = APIServiceManager(url);
      ApiResponse response = await api.post(body);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  verifyOtp({body}) async {
    try {
      APIServiceManager api = APIServiceManager(VERIFY_OTP);
      ApiResponse response = await api.post(body);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  getAllCategories({body, sellerId}) async {
    try {
      APIServiceManager api = APIServiceManager(ALL_CATEGORY);
      ApiResponse response = await api.get();
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  getStores({body, sellerId}) async {
    final bid = UserSession.shared.getBusinessUnitId();
    final url = GET_STORE + "$bid/store";
    try {
      APIServiceManager api = APIServiceManager(url);
      ApiResponse response = await api.get();
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  createProduct({body}) async {
    try {
      APIServiceManager api = APIServiceManager(CREATE_PRODUCT);
      ApiResponse response = await api.post(body);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  getAllVariations({categoryId}) async {
    final url = GET_VARIATIONS + "$categoryId/info";
    try {
      APIServiceManager api = APIServiceManager(url);
      ApiResponse response = await api.get();
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  addProductVariants({productId, body}) async {
    final url = CREATE_PRODUCT + "/$productId/variant";
    try {
      APIServiceManager api = APIServiceManager(url);
      ApiResponse response = await api.post(body);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  addShippinng({productId, body}) async {
    final url = CREATE_PRODUCT + "/$productId/shipping";
    try {
      APIServiceManager api = APIServiceManager(url);
      ApiResponse response = await api.patch(body);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  addTandC({productId, body}) async {
    final url = CREATE_PRODUCT + "/$productId/terms";
    try {
      APIServiceManager api = APIServiceManager(url);
      ApiResponse response = await api.patch(body);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  getDeliveryOptions({body}) async {
    // body["address_id"] = "d5de39df-a9b2-45b0-978e-7c61ec61a123";
    // body["product_id"] = "01545a9a-0112-440a-81bb-dde404b89c8c";

    final url = DELIVERY_OPTIONS +
        "?address_id=${body["address_id"]}" +
        "&product_id=${body["product_id"]}";
    try {
      APIServiceManager api = APIServiceManager(url);
      ApiResponse response = await api.post({});
      print(response.data.toString());
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  promoteListing({productId, body}) async {
    final url = CREATE_PRODUCT + "/$productId/promote";
    try {
      APIServiceManager api = APIServiceManager(url);
      ApiResponse response = await api.patch(body);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  createCustomVariannt({productId, body}) async {
    final url = CREATE_PRODUCT + "/$productId/promote";
    try {
      APIServiceManager api = APIServiceManager(url);
      ApiResponse response = await api.patch(body);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  getAllListingProducts(final Map<FilterType, dynamic> filters) async {
    String filterString = "";

    if (filters != null) {
      filters.forEach((key, value) => {
            filterString = filterString +
                (filterString == "" ? "?" : "&") +
                key.code() +
                value.toString()
          });
    }
    final url = CREATE_PRODUCT + filterString;
    appPrint(url);
    try {
      APIServiceManager api = APIServiceManager(url);
      ApiResponse response = await api.get();
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  userProfile(body) async {
    try {
      ApiResponse response;
      if (body != null) {
        APIServiceManager api = APIServiceManager(USER_PROFILE + "/update");
        response = await api.patch(body);
      } else {
        APIServiceManager api = APIServiceManager(USER_PROFILE);
        response = await api.get();
      }
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  getAllStores() async {
    try {
      ApiResponse response;
      APIServiceManager api = APIServiceManager(ALL_STORES);
      response = await api.get();
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  getStoresDetails(id) async {
    final url = ALL_STORES + "/$id";
    try {
      ApiResponse response;
      APIServiceManager api = APIServiceManager(url);
      response = await api.get();
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  getHomeSuffix() async {
    try {
      ApiResponse response;
      APIServiceManager api = APIServiceManager(HOME_SUFFIX_INNFO);
      response = await api.get();
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  getHomeProduct(suffix) async {
    try {
      ApiResponse response;
      APIServiceManager api =
          APIServiceManager(HOME_PRODUCT_LIST + "?category=$suffix");
      response = await api.get();
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  getProductDetails(id) async {
    try {
      ApiResponse response;
      APIServiceManager api = APIServiceManager("buy/" + GET_PRODUCTS + "/$id");
      response = await api.get();
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

/* Cart APIS */
  getCartData() async {
    try {
      ApiResponse response;
      APIServiceManager api = APIServiceManager(GET_CART);
      response = await api.get();
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  deleteCartData(id) async {
    final url = GET_CART + "/item/$id";
    try {
      ApiResponse response;
      APIServiceManager api = APIServiceManager(url);
      response = await api.delete();
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  getCartPPrice(body) async {
    final url = GET_CART + "/price";
    try {
      ApiResponse response;
      APIServiceManager api = APIServiceManager(url);
      response = await api.post(body);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  createCartInvoiceData(body) async {
    final url = CART_INVOICE;
    try {
      ApiResponse response;
      APIServiceManager api = APIServiceManager(url);
      response = await api.post(body);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  makePayment(body) async {
    final url = MAKE_PAYMENT;
    try {
      ApiResponse response;
      APIServiceManager api = APIServiceManager(url);
      response = await api.post(body);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  addToCart({body}) async {
    try {
      ApiResponse response;
      APIServiceManager api = APIServiceManager(GET_CART);
      response = await api.post(body);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  updateCartQuantity({quantity, id}) async {
    try {
      ApiResponse response;
      APIServiceManager api = APIServiceManager(
          CART_QUANTITY_UPDATE + "$id" + "?quantity=$quantity");
      response = await api.patch({});
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  getHomeDeliveryCharges({shippingId, productId}) async {
    try {
      ApiResponse response;
      APIServiceManager api = APIServiceManager(HOME_DELIVERY +
          "?shipping_id=$shippingId" +
          "&product_id=$productId");
      response = await api.patch({});
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

/* Address APIS */
  addNewAddress({
    body,
  }) async {
    try {
      APIServiceManager api = APIServiceManager(USER_ADDRESS);
      ApiResponse response =
          body["id"] != null ? await api.patch(body) : await api.post(body);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  updateNewAddress({body, id}) async {
    try {
      APIServiceManager api = APIServiceManager(USER_ADDRESS + "/$id");
      ApiResponse response = await api.patch(body);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  getAllAddress() async {
    try {
      APIServiceManager api = APIServiceManager(USER_ADDRESS);
      ApiResponse response = await api.get();
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  deleteAddress({String id}) async {
    try {
      APIServiceManager api = APIServiceManager(USER_ADDRESS + "/$id");
      ApiResponse response = await api.delete();
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  addToFavorite(body) async {
    try {
      APIServiceManager api = APIServiceManager(USER_FAVAROITE);
      ApiResponse response = await api.post(body);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  reemoveFavorite(body, id) async {
    try {
      final url = USER_FAVAROITE + "/item" + "/$id";
      APIServiceManager api = APIServiceManager(url);
      ApiResponse response = await api.delete();
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  getFavorite() async {
    try {
      APIServiceManager api = APIServiceManager(USER_FAVAROITE);
      ApiResponse response = await api.get();
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  getAllCards() async {
    try {
      APIServiceManager api = APIServiceManager(CARDS);
      ApiResponse response = await api.get();
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  addCard(body) async {
    try {
      APIServiceManager api = APIServiceManager(CARDS);
      ApiResponse response = await api.post(body);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  deleteCard(id) async {
    final url = CARDS + "?card_id=$id";
    try {
      APIServiceManager api = APIServiceManager(url);
      ApiResponse response = await api.delete();
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

/*Sellers Order Management */

  getSellerOrders({String orderId}) async {
    final sellerId = UserSession.shared.getSellerId();
    final url = CART_INVOICE + "$sellerId/" + "seller";
    try {
      APIServiceManager api = APIServiceManager(url);
      ApiResponse response = (orderId != null)
          ? await api.patch({"seller_id": sellerId, "order_id": orderId})
          : await api.patch({"seller_id": sellerId});
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  getBuyersOrders({String orderId}) async {
    final url = CART_INVOICE;
    try {
      APIServiceManager api = APIServiceManager(url);
      ApiResponse response = orderId != null
          ? await api.patch({"order_id": orderId})
          : await api.patch({});
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
  /* Search and User History */

  getBrowseHistory() async {
    final url = USER_HISTORY;
    try {
      APIServiceManager api = APIServiceManager(url);
      ApiResponse response = await api.get();
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  searchProduct({String text}) async {
    final url = PRODUCT_SEARCH + "/$text";
    try {
      APIServiceManager api = APIServiceManager(url);
      ApiResponse response = await api.get();
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  getEstimatedDelivery({String productId}) async {
    final url = ESTIMATED_DELIVERY + "?product_id=$productId";
    try {
      APIServiceManager api = APIServiceManager(url);
      ApiResponse response = await api.get();
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  updateOrderStatus({String productId, String orderId, int status}) async {
    final url = UPDATE_ORDER_STATUS +
        "?product_id=$productId" +
        "&order_id=$orderId" +
        "&status=$status";
    try {
      APIServiceManager api = APIServiceManager(url);
      ApiResponse response = await api.get();
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  creatReturnRequest({body}) async {
    final url = CREATE_RETURN_REQUEST;
    try {
      APIServiceManager api = APIServiceManager(url);
      ApiResponse response = await api.post(body);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  sellerReturnList() async {
    final sellerId = UserSession.shared.getSellerId();
    final url = GET_RETURN_LIST;
    try {
      APIServiceManager api = APIServiceManager(url);
      ApiResponse response = await api.patch({"seller_id": sellerId});
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  /* PRODUCT APP Review  */

  addProductReview({productId, body}) async {
    final url = WRITE_PRODUCT_REVIEW + "/$productId" + "/reviews";
    try {
      APIServiceManager api = APIServiceManager(url);
      ApiResponse response = await api.post(body);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  /** Free lancer signup */

  freeLancerRegister({body}) async {
    final url = FREE_LANCER_REGISTER;
    try {
      APIServiceManager api = APIServiceManager(url);
      ApiResponse response = await api.post(body);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  updateFreeLancer({body, id}) async {
    final url = FREE_LANCER_REGISTER + id;
    try {
      APIServiceManager api = APIServiceManager(url);
      ApiResponse response = await api.patch(body);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  createGig({body}) async {
    final url = CREATE_GIG;
    try {
      APIServiceManager api = APIServiceManager(url);
      ApiResponse response = await api.post(body);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  updateGig({body, id}) async {
    final url = CREATE_GIG + "$id";
    try {
      APIServiceManager api = APIServiceManager(url);
      ApiResponse response = await api.patch(body);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  getGigTags({text}) async {
    final url = CREATE_GIG + "?q=$text";
    try {
      APIServiceManager api = APIServiceManager(url);
      ApiResponse response = await api.get();
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  /******************************/

  registerDeviceToken({String token}) async {
    final url = REGISTER_DEVICE;
    try {
      APIServiceManager api = APIServiceManager(url);
      ApiResponse response = await api.post({"id": token});
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  getAllNotifications() async {
    try {
      APIServiceManager api = APIServiceManager(GET_ALL_NOTIFICATIONS);
      ApiResponse response = await api.get();
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
