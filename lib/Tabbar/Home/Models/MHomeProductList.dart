import 'package:cubesnack/Screens/Products/Models/Products.dart';

class MHomeProductList {
  List<Products> products;

  MHomeProductList({this.products});

  MHomeProductList.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = new List<Products>();
      json['products'].forEach((v) {
        products.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

// class Products {
//   String title;
//   int rating;
//   dynamic price;
//   MImage image;
//   String id;
//   bool isSameDayDelivery;
//   bool isStorePickup;
//   bool isHomeDelivery;
//   bool isFastDelivery;
//   bool isFreeShipping;
//   double discountedPrice;
//   int offerPercentage;
//   String sellerId;
//   String sku;
//   Address shippingAddress;
//   int quantity;
//   String deliveryStatus;
//   double sellingPrice;

//   Products({
//     this.title,
//     this.rating,
//     this.price,
//     this.image,
//     this.isSameDayDelivery = false,
//     this.isStorePickup = false,
//     this.isFreeShipping = false,
//     this.discountedPrice = 0.0,
//     this.sellerId,
//     this.sku,
//     this.shippingAddress,
//     this.quantity,
//     this.deliveryStatus,
//     this.sellingPrice = 0.0,
//     this.isFastDelivery = false,
//     this.isHomeDelivery = false,
//   });

//   Products.fromJson(Map<String, dynamic> json) {
//     sellerId = json['seller_id'];
//     sku = json['sku'];
//     title = json['title'];
//     id = json['id'] ?? "0";
//     if (json.containsKey("product_id")) {
//       id = json["product_id"];
//     }
//     rating = json['rating'];
//     price = json['price'];
//     isSameDayDelivery = json['is_same_day_delivery'] != null
//         ? json['is_same_day_delivery']
//         : false;
//     isStorePickup =
//         json['is_store_pickup'] != null ? json['is_store_pickup'] : false;
//     isHomeDelivery =
//         json['home_delivery'] != null ? json['home_delivery'] : false;
//     isFastDelivery =
//         json['fast_delivery'] != null ? json['fast_delivery'] : false;
//     isFreeShipping = json["is_free_shipping"];

//     image = json['image'] != null ? new MImage.fromJson(json['image']) : null;
//     discountedPrice = json["discounted_price"];
//     if (price != null)
//       offerPercentage =
//           price == 0.0 ? 0 : ((discountedPrice / price) * 100).ceil();
//     shippingAddress = json['shipping_Address'] != null
//         ? new Address.fromJson(json['shipping_Address'])
//         : null;
//     quantity = json['quantity'];
//     deliveryStatus = json['delivery_status'];
//     sellingPrice = json["selling_price"];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['title'] = this.title;
//     data['rating'] = this.rating;
//     data['price'] = this.price;
//     if (this.image != null) {
//       data['image'] = this.image.toJson();
//     }
//     return data;
//   }
// }

// class MImage {
//   String image;
//   bool isActive;

//   MImage({this.image, this.isActive});

//   MImage.fromJson(Map<String, dynamic> json) {
//     image = json['image'];
//     isActive = json['is_active'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['image'] = this.image;
//     data['is_active'] = this.isActive;
//     return data;
//   }
// }
