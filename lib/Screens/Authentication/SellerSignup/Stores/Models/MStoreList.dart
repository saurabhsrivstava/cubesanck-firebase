import 'package:cubesnack/Screens/Authentication/SellerSignup/Pages/BusinessInfo/Models/MStore.dart';

class MStoreList {
  List<MStore> store;

  MStoreList({this.store});

  MStoreList.fromJson(Map<String, dynamic> json) {
    if (json['stores'] != null) {
      store = new List<MStore>();
      json['stores'].forEach((v) {
        store.add(new MStore.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.store != null) {
      data['stores'] = this.store.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
