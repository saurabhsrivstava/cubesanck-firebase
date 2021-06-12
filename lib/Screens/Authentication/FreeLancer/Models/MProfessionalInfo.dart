import 'package:cubesnack/Constants/AppExtensions.dart';

class MProfessionalInfo {
  String occupation;
  List<MSkill> skills;
  List<MEducation> educations;
  List<MCertification> certifications;
  String website;

  MProfessionalInfo.init() {
    skills = List.filled(1, MSkill(), growable: true);
    educations = List.filled(1, MEducation(), growable: true);
    certifications = List.filled(1, MCertification(), growable: true);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['occupation'] = [this.occupation];
    data["skills"] = skills.map((e) => e.toJson()).toList();
    data["education"] = educations.map((e) => e.toJson()).toList();
    data["certification"] = certifications.map((e) => e.toJson()).toList();
    data["personal_website"] = website;
    data["is_completed"] = false;
    data["step"] = 2;
    return data;
  }

  validate() {
    String skillError;
    String educationError;
    String certificationError;

    skills.forEach((element) {
      skillError = element.validate();
    });
    educations.forEach((element) {
      educationError = element.validate();
    });
    certifications.forEach((element) {
      certificationError = element.validate();
    });

    if (this.occupation == null) {
      return "Please select vaid occupation";
    } else if (skillError != null) {
      return skillError;
    } else if (educationError != null) {
      return educationError;
    } else if (certificationError != null) {
      return certificationError;
    } else {
      return null;
    }
  }
}

class MSkill {
  String skillName;
  String exp;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.skillName;
    data['experience'] = this.exp;
    return data;
  }

  validate() {
    if (this.skillName.isNull()) {
      return "Please enter valid skill name";
    } else if (this.exp.isNull()) {
      return "Please enter valid experience";
    } else {
      return null;
    }
  }
}

class MEducation {
  String country;
  String collegeName;
  String post;
  int year;
  String title;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['college_name'] = this.collegeName;
    data['post_title'] = this.title;
    data['post_name'] = this.post;
    data['year'] = this.year;
    return data;
  }

  validate() {
    if (this.country.isNull()) {
      return "Please enter valid country.";
    } else if (this.collegeName.isNull()) {
      return "Please enter valid college name.";
    } else if (this.post.isNull()) {
      return "Please enter valid post name.";
    } else if (this.year == null) {
      return "Please enter valid year.";
    } else if (this.title.isNull()) {
      return "Please enter valid title.";
    } else {
      return null;
    }
  }
}

class MCertification {
  String award;
  String crtifiedFrom;
  int year;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.award;
    data['title'] = this.crtifiedFrom;
    data['year'] = this.year;
    return data;
  }

  validate() {
    if (this.award.isNull()) {
      return "Please enter valid award.";
    } else if (this.crtifiedFrom.isNull()) {
      return "Please enter valid certified from.";
    } else if (this.year == null) {
      return "Please enter valid year.";
    } else {
      return null;
    }
  }
}
