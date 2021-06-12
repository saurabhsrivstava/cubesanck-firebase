import 'package:cubesnack/Constants/AppExtensions.dart';

class MPaymentInfo {
  String email;
  String phone;
  bool isPhoneVerified;

  validate() {
    if (this.email.isNull()) {
      return "validateEmail";
    } else if (this.phone.isNull()) {
      return "validatePhone";
    } else {
      return null;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['phone_number'] = this.phone;
    data["is_completed"] = false;
    data["step"] = 3;
    return data;
  }
}
