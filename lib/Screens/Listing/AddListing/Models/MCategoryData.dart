class MCategoryResponse {
  List<MCategoryData> categories;

  MCategoryResponse({this.categories});

  MCategoryResponse.fromJson(List<dynamic> json) {
    categories = new List<MCategoryData>();
    json.forEach((v) {
      categories.add(new MCategoryData.fromJson(v));
    });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categories != null) {
      data['Categories'] = this.categories.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MCategoryData {
  MCategory category;
  List<MCategory> options;

  MCategoryData({this.category, this.options});

  MCategoryData.fromJson(Map<String, dynamic> json) {
    category = json['category'] != null
        ? new MCategory.fromJson(json['category'])
        : null;
    if (json['options'] != null) {
      options = new List<MCategory>();
      json['options'].forEach((v) {
        options.add(new MCategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.category != null) {
      data['category'] = this.category.toJson();
    }
    if (this.options != null) {
      data['options'] = this.options.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MCategory {
  String id;
  String name;
  String logo;
  MCategory({this.id, this.name, this.logo});

  MCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    this.logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
