class MNotificationResponse {
  List<MNotificationData> data;

  MNotificationResponse({this.data});

  MNotificationResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<MNotificationData>();
      json['data'].forEach((v) {
        data.add(new MNotificationData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MNotificationData {
  String id;
  String screenName;
  String genericId;
  String message;

  MNotificationData({this.id, this.screenName, this.genericId, this.message});

  MNotificationData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    screenName = json['screenName'];
    genericId = json['generic_id'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['screenName'] = this.screenName;
    data['generic_id'] = this.genericId;
    data['message'] = this.message;
    return data;
  }
}
