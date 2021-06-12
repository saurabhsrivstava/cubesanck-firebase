import 'package:cubesnack/Constants/Constants.dart';
import 'package:cubesnack/Utils/AppDate.dart';

import 'Products.dart';

class MReturn extends Products {
  String description;
  String status;
  String returnDate;
  String returnCreatedDate;
  String orderDate;
  String reason;
  int quantity;

  MReturn.fromJson(Map<String, dynamic> json) {
    description = json["description"];
    status = json["status"];
    returnDate = json["return_date"];
    returnCreatedDate = AppDate.dateFormate(json["return_created_date"]);
    orderDate = AppDate.dateFormate(json["ordered_date"]);
    reason = json["reason"];
    id = json["product_id"];
    title = json["title"];
    brandManufacturer = json["brand_manufacturer"];
    sellingPrice = json["selling_price"];
    quantity = json["quantity"] ?? 0;
    if (json['images'] != null) {
      images = new List<MImage>();
      json['images'].forEach((v) {
        images.add(new MImage.fromJson(v));
      });
    }
  }
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['comment'] = this.message;
  //   data['rating'] = this.rating;
  //   return data;
  // }
}
