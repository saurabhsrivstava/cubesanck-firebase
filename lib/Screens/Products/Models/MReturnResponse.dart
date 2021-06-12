import 'package:cubesnack/Screens/Products/Models/MReturn.dart';

class MReturnResponse {
  List<MReturn> items;

  MReturnResponse({this.items});

  MReturnResponse.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = new List<MReturn>();
      json['items'].forEach((v) {
        items.add(new MReturn.fromJson(v));
      });
    }
  }
}
