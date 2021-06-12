import 'package:cubesnack/Utils/AppDate.dart';

class MReview {
  String message;
  int rating;
  String userName;
  String createdAt;
  String profile;
  MReview(
      {this.message, this.rating, this.userName, this.createdAt, this.profile});

  MReview.fromJson(Map<String, dynamic> json) {
    message = json["comment"];
    rating = json["rating"];
    profile = json["user_profile_pic"];
    createdAt = AppDate.dateFormate(json["created_at"]);
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['comment'] = this.message;
    data['rating'] = this.rating;
    return data;
  }
}
