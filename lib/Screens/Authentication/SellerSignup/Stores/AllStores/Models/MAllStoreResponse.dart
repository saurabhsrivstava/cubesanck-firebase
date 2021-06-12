import 'package:cubesnack/Screens/Authentication/SellerSignup/Pages/BusinessInfo/Models/MStore.dart';

class MAllStoreResponse {
  List<MStore> allStores;

  MAllStoreResponse({this.allStores});

  MAllStoreResponse.fromJson(Map<String, dynamic> json) {
    if (json['allStores'] != null) {
      allStores = new List<MStore>();
      json['allStores'].forEach((v) {
        allStores.add(new MStore.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.allStores != null) {
      data['allStores'] = this.allStores.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
