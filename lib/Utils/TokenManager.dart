import 'package:cubesnack/Screens/Notifications/Manager/NotificationManager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'UserSession.dart';

class TokenManager {
  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static setToken({String token}) async {
    UserSession.shared.setToken(token);
    final SharedPreferences prefs = await _prefs;
    prefs.setString(AppKey.token.toString(), token);
  }

  static Future<bool> getToken(context) async {
    final SharedPreferences prefs = await _prefs;
    final token = prefs.getString(AppKey.token.toString());
    await getSellerId();
    await getLoginCred();
    await getProductStatus();
    await getLastSellerStatus();
    if (token != null) UserSession.shared.setToken(token);
    if (token != null) NotificationManager.shared.registerForFCM(context);
    return token != null ? true : false;
  }

  static setLoginCred({String email, String password}) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString(AppKey.email.toString(), email);
    prefs.setString(AppKey.password.toString(), password);
  }

  static getLoginCred({String email, String password}) async {
    final SharedPreferences prefs = await _prefs;
    final email = prefs.getString(AppKey.email.toString());
    final password = prefs.getString(AppKey.password.toString());
    UserSession.shared.setemail(email);
    UserSession.shared.setPassword(password);
  }

  static saveSellerId({String sellerId}) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString(AppKey.sellerId.toString(), sellerId);
    UserSession.shared.setSellerId(sellerId);
  }

  static getSellerId({String sellerId}) async {
    final SharedPreferences prefs = await _prefs;
    final sId = prefs.getString(AppKey.sellerId.toString());
    UserSession.shared.setSellerId(sId);
  }

  static saveFreeLancerId({String freeLancerId}) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString(AppKey.freeLancerId.toString(), freeLancerId);
    UserSession.shared.freeLancerId = freeLancerId;
  }

  static getFreeLancerId() async {
    final SharedPreferences prefs = await _prefs;
    final sId = prefs.getString(AppKey.freeLancerId.toString());
    UserSession.shared.freeLancerId = sId;
  }

  static setProductStatus() async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString(AppKey.productId.toString(), UserSession.shared.productId);
    prefs.setInt(AppKey.productStep.toString(), UserSession.shared.productStep);
    prefs.setString(AppKey.category.toString(), UserSession.shared.category);
  }

  static setLastSellerStatus() async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString(
        AppKey.lastSellerId.toString(), UserSession.shared.lastSellerId);
    prefs.setInt(
        AppKey.lastSellerStep.toString(), UserSession.shared.lastSellerStep);
  }

  static getLastSellerStatus() async {
    final SharedPreferences prefs = await _prefs;
    final lastSellerId = prefs.getString(AppKey.lastSellerId.toString());
    final step = prefs.getInt(AppKey.lastSellerStep.toString());
    UserSession.shared.lastSellerStep = step;
    UserSession.shared.lastSellerId = lastSellerId;
  }

  static resetLastSeller() async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString(AppKey.lastSellerId.toString(), null);
    prefs.setInt(AppKey.lastSellerStep.toString(), 0);
    UserSession.shared.resetLastSeller();
  }

  static resetLastProduct() async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString(AppKey.productId.toString(), null);
    prefs.setInt(AppKey.productStep.toString(), 0);
    prefs.setString(AppKey.category.toString(), null);
    UserSession.shared.resetLastProduct();
  }

  static getProductStatus() async {
    final SharedPreferences prefs = await _prefs;
    final productId = prefs.getString(AppKey.productId.toString());
    final step = prefs.getInt(AppKey.productStep.toString());
    final category = prefs.getString(AppKey.category.toString());
    UserSession.shared.productId = productId;
    UserSession.shared.productStep = step;
    UserSession.shared.category = category;
  }

  static resetPreference() async {
    final SharedPreferences prefs = await _prefs;
    final allKeys = prefs.getKeys();
    for (var key in allKeys) {
      if (key != AppKey.email.toString() || key != AppKey.password.toString()) {
        prefs.remove(key);
      }
    }
    UserSession.shared.resetSession();
  }
}
