class MHomeSuffixResponse {
  List<Categories> categories;

  MHomeSuffixResponse({this.categories});

  MHomeSuffixResponse.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = new List<Categories>();
      json['categories'].forEach((v) {
        categories.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categories != null) {
      data['categories'] = this.categories.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  String displayName;
  String apiSuffix;

  Categories({this.displayName, this.apiSuffix});

  Categories.fromJson(Map<String, dynamic> json) {
    displayName = json['display_name'];
    apiSuffix = json['api_suffix'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['display_name'] = this.displayName;
    data['api_suffix'] = this.apiSuffix;
    return data;
  }
}
