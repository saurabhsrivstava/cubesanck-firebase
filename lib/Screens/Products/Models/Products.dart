import 'package:cubesnack/Screens/Authentication/SellerSignup/Pages/BusinessInfo/Models/BusinessInfo.dart';
import 'package:cubesnack/Screens/Products/Models/MReview.dart';
import 'package:cubesnack/Screens/Products/Models/MReviewsSummary.dart';

class Products {
  String id;
  String title;
  int rating;
  double price;
  bool isSameDayDelivery;
  bool isStorePickup;
  MImage image;
  List<String> additionalInfo;
  String description;
  int unitsInStock;
  String brandManufacturer;
  double sellingPrice;
  double discountedPrice;
  List<MImage> images;
  List<Variants> variants;
  List<MReview> reviews;
  Warranty warranty;
  String legalDiscalimer;
  bool isReturnAccepted;
  int offerPercenntage;
  bool isWishListed;
  String sellerId;
  MReviewsSummary reviewsSummary;
  bool isHomeDelivery;
  bool isFastDelivery;
  bool isFreeShipping;
  String sku;
  Address shippingAddress;
  int quantity;
  String deliveryStatus;
  String labelPdfUrl;
  String labelUrl;
  String trackingId;
  String trackingUrl;

  Products(
      {this.id,
      this.title,
      this.rating,
      this.price,
      this.isSameDayDelivery,
      this.isStorePickup,
      this.image,
      this.additionalInfo,
      this.description,
      this.unitsInStock,
      this.brandManufacturer,
      this.sellingPrice,
      this.discountedPrice,
      this.images,
      this.variants,
      this.warranty,
      this.legalDiscalimer,
      this.isReturnAccepted,
      this.sellerId,
      this.reviewsSummary,
      this.isFastDelivery,
      this.isHomeDelivery,
      this.reviews,
      this.deliveryStatus,
      this.isFreeShipping,
      this.isWishListed,
      this.offerPercenntage,
      this.quantity,
      this.shippingAddress,
      this.sku,
      this.labelPdfUrl,
      this.labelUrl,
      this.trackingId});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json.containsKey("product_id")) {
      id = json["product_id"];
    }
    title = json['title'];
    rating = json['rating'];
    price = json['price'] == 0 ? 0.0 : json['price'];
    isSameDayDelivery = json['is_same_day_delivery'] != null
        ? json['is_same_day_delivery']
        : false;
    isStorePickup =
        json['is_store_pickup'] != null ? json['is_store_pickup'] : false;
    isHomeDelivery =
        json['home_delivery'] != null ? json['home_delivery'] : false;
    isFastDelivery =
        json['fast_delivery'] != null ? json['fast_delivery'] : false;
    isFreeShipping = json["is_free_shipping"];

    image = json['image'] != null ? new MImage.fromJson(json['image']) : null;
    if (json.containsKey("additional_info")) if (json
        .containsKey("additional_info"))
      additionalInfo = json['additional_info'].cast<String>();
    description = json['description'];
    unitsInStock = json['units_in_stock'];
    brandManufacturer = json['brand_manufacturer'];
    sellingPrice = json['selling_price'];
    discountedPrice = json['discounted_price'];
    isWishListed = json["is_wish_listed"] ?? false;
    sellerId = json["seller_id"];
    sku = json['sku'];

    if (json['images'] != null) {
      images = new List<MImage>();
      json['images'].forEach((v) {
        images.add(new MImage.fromJson(v));
      });
    }
    if (json['variants'] != null) {
      variants = new List<Variants>();
      json['variants'].forEach((v) {
        variants.add(new Variants.fromJson(v));
      });
    }
    if (json['reviews'] != null) {
      reviews = new List<MReview>();
      json['reviews'].forEach((v) {
        reviews.add(new MReview.fromJson(v));
      });
    }

    quantity = json['quantity'];
    deliveryStatus = json['delivery_status'];
    sellingPrice = json["selling_price"];

    if (json['reviews_summary'] != null) {
      reviewsSummary = MReviewsSummary.fromJson(json["reviews_summary"]);
    }
    warranty = json['warranty'] != null
        ? new Warranty.fromJson(json['warranty'])
        : null;
    legalDiscalimer = json['legal_discalimer'];
    isReturnAccepted = json['is_return_accepted'];
    if (price != null)
      offerPercenntage =
          price == 0.0 ? 0 : ((discountedPrice / price) * 100).ceil();
    shippingAddress = json['shipping_Address'] != null
        ? new Address.fromJson(json['shipping_Address'])
        : null;

    labelUrl = json["label_url"];
    labelPdfUrl = json["label_pdf_url"];
    trackingId = json["tracking_id"];
    trackingUrl = json["tracking_url"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['rating'] = this.rating;
    data['price'] = this.price;
    data['is_same_day_delivery'] = this.isSameDayDelivery;
    data['is_store_pickup'] = this.isStorePickup;
    if (this.image != null) {
      data['image'] = this.image.toJson();
    }
    data['additional_info'] = this.additionalInfo;
    data['description'] = this.description;
    data['units_in_stock'] = this.unitsInStock;
    data['brand_manufacturer'] = this.brandManufacturer;
    data['selling_price'] = this.sellingPrice;
    data['discounted_price'] = this.discountedPrice;
    if (this.images != null) {
      data['images'] = this.images.map((v) => v.toJson()).toList();
    }
    if (this.variants != null) {
      data['variants'] = this.variants.map((v) => v.toJson()).toList();
    }
    if (this.warranty != null) {
      data['warranty'] = this.warranty.toJson();
    }
    data['legal_discalimer'] = this.legalDiscalimer;
    data['is_return_accepted'] = this.isReturnAccepted;
    return data;
  }
}

class MImage {
  String image;
  bool isActive;

  MImage({this.image, this.isActive});

  MImage.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['is_active'] = this.isActive;
    return data;
  }
}

class Variants {
  String id;
  String image;
  double regularPrice;
  double salePrice;
  int availableQuantity;
  List<String> variantOptions;
  int disCountPercentage;

  Variants(
      {this.image,
      this.regularPrice,
      this.salePrice,
      this.availableQuantity,
      this.variantOptions,
      this.id});

  Variants.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    regularPrice = json['regular_price'];
    salePrice = json['sale_price'];
    availableQuantity = json['available_quantity'];
    variantOptions = json['variant_options'].cast<String>();
    id = json["id"];
    disCountPercentage =
        regularPrice == 0.0 ? 0 : ((salePrice / regularPrice) * 100).ceil();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['regular_price'] = this.regularPrice;
    data['sale_price'] = this.salePrice;
    data['available_quantity'] = this.availableQuantity;
    data['variant_options'] = this.variantOptions;
    return data;
  }
}

class Warranty {
  String description;
  List<String> conditions;
  String doc;

  Warranty({this.description, this.conditions, this.doc});

  Warranty.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    conditions = json['conditions'].cast<String>();
    doc = json['doc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['conditions'] = this.conditions;
    data['doc'] = this.doc;
    return data;
  }
}

class MAddCartResponse {
  List<MCart> items;

  MAddCartResponse({this.items});

  MAddCartResponse.intit() {
    items = List<MCart>();
  }

  MAddCartResponse.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = new List<MCart>();
      json['items'].forEach((v) {
        items.add(new MCart.fromJson(v));
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

class MCart {
  String productId;
  int quantity;
  String variantId;

  MCart({this.productId, this.quantity, this.variantId});

  MCart.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    quantity = json['quantity'];
    variantId = json['variant_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['quantity'] = this.quantity;
    data['variant_id'] = this.variantId;
    return data;
  }
}
