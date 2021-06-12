class MAccountSec {
  String email;
  String phone;
  bool isPhoneVerified;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['phone_number'] = this.phone;
    data["is_completed"] = false;
    data["step"] = 3;
    return data;
  }
}
