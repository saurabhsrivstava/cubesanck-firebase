import 'package:cubesnack/Screens/Authentication/SellerSignup/Pages/BusinessInfo/Models/BusinessInfo.dart';
import 'package:cubesnack/Screens/Products/Models/Products.dart';

class MOrderResponse {
  List<MOrder> items;

  MOrderResponse({this.items});

  MOrderResponse.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = new List<MOrder>();
      json['items'].forEach((v) {
        items.add(new MOrder.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MOrder {
  List<Products> items;
  String orderId;
  String createdAt;
  Address billingAddress;
  String status;
  double totalAmount;
  String deliveredDate;
  String paymentType;
  double platformCut;
  double sellerCut;

  MOrder(
      {this.deliveredDate,
      this.items,
      this.orderId,
      this.createdAt,
      this.billingAddress,
      this.status,
      this.totalAmount,
      this.paymentType,
      this.platformCut,
      this.sellerCut});

  MOrder.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = new List<Products>();
      json['items'].forEach((v) {
        items.add(new Products.fromJson(v));
      });
    }
    billingAddress = json['billing_address'] != null
        ? new Address.fromJson(json['billing_address'])
        : null;
    orderId = json['orderId'];
    createdAt = json['created_at'];
    status = json["status"];
    totalAmount = json["total_amount"];
    deliveredDate = json["delivered_date"];
    paymentType = json['payment_type'];
    platformCut = json["platform_cut"];
    sellerCut = json["seller_cut"] ?? 0.0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    data['orderId'] = this.orderId;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class StoreDetails {
  String displayName;
  bool isStorePickup;
  bool isActive;
  Address storeAddress;

  StoreDetails(
      {this.displayName, this.isStorePickup, this.isActive, this.storeAddress});

  StoreDetails.fromJson(Map<String, dynamic> json) {
    displayName = json['display_name'];
    isStorePickup = json['is_store_pickup'];
    isActive = json['is_active'];
    storeAddress = json['store_address'] != null
        ? new Address.fromJson(json['store_address'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['display_name'] = this.displayName;
    data['is_store_pickup'] = this.isStorePickup;
    data['is_active'] = this.isActive;
    if (this.storeAddress != null) {
      data['store_address'] = this.storeAddress.toJson();
    }
    return data;
  }
}
