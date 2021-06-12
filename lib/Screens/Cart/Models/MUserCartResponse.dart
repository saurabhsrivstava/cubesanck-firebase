import 'package:cubesnack/Constants/AppEnums.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Pages/BusinessInfo/Models/BusinessInfo.dart';
import 'package:cubesnack/Tabbar/Home/Models/MHomeProductList.dart';

import 'FastShippingResponse.dart';

class MUserCartResponse {
  List<MCartItem> items;
  String cartId;

  MUserCartResponse({this.items, this.cartId});

  MUserCartResponse.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = new List<MCartItem>();
      cartId = json["id"];
      json['items'].forEach((v) {
        items.add(new MCartItem.fromJson(v, cartId));
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

class MCartItem {
  String id;
  int quantity;
  Product product;
  Store store;
  CartDelivery delivery;
  CardData data;
  FastShipping fastShipping;

  MCartItem(
      {this.id,
      this.quantity,
      this.product,
      this.store,
      this.delivery = CartDelivery.store,
      this.data,
      this.fastShipping});

  MCartItem.fromJson(Map<String, dynamic> json, cartId) {
    id = json['id'];
    quantity = json['quantity'];
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
    store = json['store'] != null ? new Store.fromJson(json['store']) : null;
    this.delivery = CartDelivery.store;
    this.data = CardData.init(this);
    this.data.cartItemId = cartId;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['quantity'] = this.quantity;
    if (this.product != null) {
      data['product'] = this.product.toJson();
    }
    if (this.store != null) {
      data['store'] = this.store.toJson();
    }
    return data;
  }
}

class Product {
  String title;
  double price;
  String image;
  String productId;
  String variantId;
  bool isReturnable;
  String sellerId;
  bool isHomeDelivery;
  bool isStorePickup;
  bool isFastShipping;

  Product(
      {this.title,
      this.price,
      this.image,
      this.productId,
      this.variantId,
      this.isReturnable,
      this.sellerId,
      this.isFastShipping = false,
      this.isHomeDelivery = false,
      this.isStorePickup = false});

  Product.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    price = json['price'];
    image = json['image'];
    productId = json['product_id'];
    variantId = json['variant_id'];
    isReturnable = json['is_returnable'];
    sellerId = json['seller_id'];
    isHomeDelivery = json["home_delivery"];
    isStorePickup = json["store_pickup"];
    isFastShipping = json["fast_delivery"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['price'] = this.price;
    data['image'] = this.image;
    data['product_id'] = this.productId;
    data['variant_id'] = this.variantId;
    data['is_returnable'] = this.isReturnable;
    return data;
  }
}

class Store {
  String storeId;
  List<MPhysicalStore> physicalStores;

  Store({this.storeId, this.physicalStores});

  Store.fromJson(Map<String, dynamic> json) {
    storeId = json['store_id'];
    if (json['physical_stores'] != null) {
      physicalStores = new List<MPhysicalStore>();
      json['physical_stores'].forEach((v) {
        physicalStores.add(new MPhysicalStore.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['store_id'] = this.storeId;
    if (this.physicalStores != null) {
      data['physical_stores'] =
          this.physicalStores.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MPhysicalStore {
  String name;
  Address address;

  MPhysicalStore({this.name, this.address});

  MPhysicalStore.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.address != null) {
      data['address'] = this.address.toJson();
    }
    return data;
  }
}

class CardData {
  String cartItemId;
  bool isStorePickup;
  String physicalPickupStoreId;
  bool isFastShipping;
  String productId;
  //String userShippingAddress;
  //UserBillingAddress userBillingAddress;
  String shippingId;
  bool isHomeDelivery;
  int payementMode;
  String title;
  double sellingPrice;
  int quantity;
  String sellerId;
  bool isReturnAccepted = false;

  CardData.init(MCartItem item) {
    // userBillingAddress = UserBillingAddress();
    // userBillingAddress.address = Address();
    physicalPickupStoreId = item.store.physicalStores.length > 0
        ? item.store?.physicalStores?.first?.address?.id
        : '';

    isFastShipping = false;
    isHomeDelivery = false;
    isStorePickup = true;
    productId = item.product.productId;
    cartItemId = item.id;
    title = item.product.title;
    sellingPrice = item.product.price;
    quantity = item.quantity;
    sellerId = item.product.sellerId;
    isReturnAccepted = item.product.isReturnable;
  }

  updateDeliveryOption(
      {bool store = false,
      bool home = false,
      bool fast = false,
      String storeId,
      String shippingAddressId}) {
    if (store) {
      this.isStorePickup = store;
      this.isHomeDelivery = false;
      this.isFastShipping = false;
      physicalPickupStoreId = storeId;
      shippingId = '';
      // billingId = '';
    } else if (home) {
      this.isHomeDelivery = home;
      this.isStorePickup = false;
      this.isFastShipping = false;
      fast = false;
      physicalPickupStoreId = '';
      shippingId = shippingAddressId;
    } else {
      this.isFastShipping = fast;
      this.isHomeDelivery = false;
      this.isStorePickup = false;
      home = false;
      physicalPickupStoreId = '';
      shippingId = shippingAddressId;
    }
  }

  CardData(
      {this.cartItemId,
      this.isStorePickup,
      this.physicalPickupStoreId,
      this.isFastShipping,
      this.isHomeDelivery,
      this.payementMode,
      this.shippingId,
      this.productId});

  CardData.fromJson(Map<String, dynamic> json) {
    cartItemId = json['cart_item_id'];
    isStorePickup = json['is_store_pickup'];
    physicalPickupStoreId = json['physical_pickup_store_id'];
    isFastShipping = json['is_fast_shipping'];
    shippingId = json['user_shipping_address'];
    isHomeDelivery = json['is_home_delivery'];
    payementMode = json['payement_mode'];
  }

  Map<String, dynamic> toJson({FastShipping fastShipping}) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data["seller_id"] = this.sellerId;
    if (shippingId.length > 0) data["shiping_address_id"] = shippingId;
    if (physicalPickupStoreId.length > 0)
      data["store_id"] = this.physicalPickupStoreId;
    data["cart_id"] = this.cartItemId;
    data["title"] = this.title;
    data["selling_price"] = this.sellingPrice;
    data["quantity"] = this.quantity;
    data["home_delivery"] = isHomeDelivery;
    data["store_pickup"] = isStorePickup;
    data["fast_delivery"] = isFastShipping;
    data["is_return_accepted"] = isReturnAccepted;
    if (fastShipping != null) data["rate_info"] = fastShipping.toJson();
    return data;
  }
}

class UserBillingAddress {
  String id;
  String name;
  Address address;
  bool isDefault;

  UserBillingAddress({this.id, this.name, this.address, this.isDefault});

  UserBillingAddress.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    isDefault = json['is_default'];
    address = Address();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.address != null) {
      data['address'] = this.address.toJson();
    }
    data['is_default'] = this.isDefault;
    return data;
  }
}
