import 'package:cubesnack/Constants/AppExtensions.dart';

class MFrPersonalInfo {
  String firstName;
  String lastName;
  String state;
  String description;
  String profileId;

  validate() {
    if (this.firstName.isNull()) {
      return "validateFName";
    } else if (this.lastName.isNull()) {
      return "validateLName";
    } else if (this.state.isNull()) {
      return "validateState";
    } else if (this.description.isNull()) {
      return "validateDesc";
    } else if (this.profileId.isNull()) {
      return "validateProfile";
    } else {
      return null;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['state'] = this.state;
    data['description'] = this.description;
    data['profile_pic_id'] = this.profileId;
    data["is_completed"] = false;
    data["step"] = 1;
    return data;
  }
}
