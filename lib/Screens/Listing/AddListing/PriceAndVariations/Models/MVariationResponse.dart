class MVariationResponse {
  bool isNew;
  bool isRefurbished;
  bool isOld;
  List<MVariants> variants;

  MVariationResponse(
      {this.isNew, this.isRefurbished, this.isOld, this.variants});

  MVariationResponse.fromJson(Map<String, dynamic> json) {
    isNew = json['is_new'];
    isRefurbished = json['is_refurbished'];
    isOld = json['is_old'];
    if (json['variants'] != null) {
      variants = new List<MVariants>();
      json['variants'].forEach((v) {
        variants.add(new MVariants.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_new'] = this.isNew;
    data['is_refurbished'] = this.isRefurbished;
    data['is_old'] = this.isOld;
    if (this.variants != null) {
      data['variants'] = this.variants.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MVariants {
  MVariationType type;
  List<MVariationType> options;

  MVariants({this.type, this.options});

  MVariants.fromJson(Map<String, dynamic> json) {
    type = json['type'] != null
        ? new MVariationType.fromJson(json['type'], '')
        : null;
    if (json['options'] != null) {
      options = new List<MVariationType>();
      json['options'].forEach((v) {
        final option =  new MVariationType.fromJson(v, type.id);
        options.add(new MVariationType.fromJson(v, type.id));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.type != null) {
      data['type'] = this.type.toJson();
    }
    if (this.options != null) {
      data['options'] = this.options.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MVariationType {
  String id;
  String name;
  String type;

  MVariationType({this.id, this.name, this.type});

  MVariationType.fromJson(Map<String, dynamic> json, t) {
    id = json['id'];
    name = json['name'];
    type  = t;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
