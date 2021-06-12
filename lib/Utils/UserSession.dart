import 'package:cubesnack/Constants/AppEnums.dart';
import 'package:cubesnack/Screens/Cart/Bloc/index.dart';
import 'package:cubesnack/Utils/JWTDecoder.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class UserSession {
  static final UserSession shared = UserSession._internal();
  String _sessionId;
  String _token;
  int _currentTab;
  String _name;
  UserRoles role;
  String _businessUnitId;
  CartBloc bloc;
  List<String> states;
  String email;
  String password;
  String _sellerId;
  String _productId;
  int _productStep;
  String _category;
  String _lastSellerId;
  int _lastSellerStep;
  String _lastFreeLancerId;
  int _freeLancerLastStep;

  factory UserSession() {
    return shared;
  }

  UserSession._internal() {
    _sessionId = '';
    _token = '';
    _currentTab = 0;
    _name = '';
    role = UserRoles.buyer;
    _businessUnitId = '';
    bloc = CartBloc(CartDefaultState());
  }

  refreshCart() {
    bloc.add(LoadCartEvent());
  }

  setSessionId(value) {
    _sessionId = value;
  }

  getSessionId() {
    return _sessionId;
  }

  setToken(value) {
    final values = JWTDecoder.parseJwt(value);
    if (values.containsKey("data")) {
      _updateUserDetails(values["data"]);
    }
    _token = value;
  }

  String getToken() {
    return _token;
  }

  bool isLoggedIn() {
    return _token?.isNotEmpty ?? false;
  }

  setCurrentTab(value) {
    _currentTab = value;
  }

  getCurrentTab() {
    return _currentTab;
  }

  setUserName(value) {
    _name = value;
  }

  getUserName() {
    return _name;
  }

  setRole(value) {
    role = value;
  }

  _updateUserDetails(Map<String, dynamic> data) {
    setUserName(data["name"]);
    UserSession.shared.email = data["email"];
    role = _setRole(data["role"]);
    setBusinessUnitId(data["buisness_unit_id"]);
  }

  ///Role checking
  _setRole(value) {
    if (value.length == 1 && value.first == "buyer") {
      return UserRoles.buyer;
    } else if (value.contains("seller")) {
      return UserRoles.seller;
    } else {
      return UserRoles.freelancer;
    }
  }

  isSeller() => role == UserRoles.seller;
  isBuyer() => role == UserRoles.buyer;
  isFreelancer() => role == UserRoles.freelancer;

  setBusinessUnitId(value) {
    _businessUnitId = value;
  }

  getBusinessUnitId() {
    return _businessUnitId;
  }

  Future<List<dynamic>> _states() async {
    List<dynamic> response;
    response = jsonDecode(await rootBundle.loadString('localData/states.json'));
    return response;
  }

  getStates() async {
    final state = await _states();
    states = state;
    return state.map((e) => e["name"]).toList();
  }

  resetLastProduct() {
    _productStep = 0;
    _productId = "";
  }

  resetLastSeller() {
    _lastSellerStep = 0;
    _lastSellerId = "";
  }

  get productId => _productId;
  set productId(v) => _productId = v;
  set category(v) => _category = v;
  get category => _category;

  set lastSellerId(v) => _lastSellerId = v;
  get lastSellerId => _lastSellerId;

  set lastSellerStep(v) => _lastSellerStep = v;
  get lastSellerStep => _lastSellerStep;

  set lastFreelancerStep(v) => _freeLancerLastStep = v;
  get lastFreelancerStep => _freeLancerLastStep;

  get productStep => _productStep;
  set productStep(v) => _productStep = v;

  setemail(v) => email = v;
  setPassword(v) => password = v;
  getemail() => email;
  getPassword() => password;
  setSellerId(v) => _sellerId = v;
  getSellerId() => _sellerId;

  get freeLancerId => _lastFreeLancerId;
  set freeLancerId(v) => _lastFreeLancerId = v;

  resetSession() {
    _sessionId = '';
    _token = null;
    _currentTab = 0;
    role = UserRoles.buyer;
    _name = "";
    role = null;
    _businessUnitId = "";
    email = "";
    password = "";
    _sellerId = "";
    _productId = "";
    _productStep = 0;
    _category = "";
    _lastSellerId = "";
    _lastSellerStep = 0;
  }
}

enum AppKey {
  login,
  sessionId,
  token,
  email,
  password,
  sellerId,
  productId,
  productStep,
  category,
  lastSellerStep,
  lastSellerId,
  freeLancerId
}
