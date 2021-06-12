class MUserProfile {
  String fullname;
  String email;
  String contactNo;
  String profilePic;

  MUserProfile({this.fullname, this.email, this.contactNo, this.profilePic});

  MUserProfile.fromJson(Map<String, dynamic> json) {
    fullname = json['fullname'];
    email = json['email'];
    contactNo = json['contact_no'];
    profilePic = json.containsKey("profile_pic") && json["profile_pic"] != null
        ? json["profile_pic"]
        : "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (fullname != null) data['fullname'] = this.fullname;
    if (email != null) data['email'] = this.email;
    if (contactNo != null) data['contact_no'] = this.contactNo;
    if (profilePic.length > 0 && !profilePic.contains("https"))
      data['profile_pic'] = this.profilePic;
    return data;
  }
}
