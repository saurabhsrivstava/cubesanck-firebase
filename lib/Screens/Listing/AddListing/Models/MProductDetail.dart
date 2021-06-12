class MProductDetail {
  List<dynamic> stores;
  String category;
  List<dynamic> subCategory;
  String title;
  String brandManufacturer;
  MProductCode productCode;
  int unitsInStoc;
  String description;
  List<String> bulletPoints;
  List<String> images;
  bool isActive;

  MProductDetail.init() {
    stores = List<String>();
    subCategory = List<String>();
    productCode = MProductCode();
    bulletPoints = List<String>();
    images = List<String>();
    isActive = true;
  }

  MProductDetail(
      {this.stores,
      this.category,
      this.subCategory,
      this.title,
      this.brandManufacturer,
      this.productCode,
      this.unitsInStoc,
      this.description,
      this.bulletPoints,
      this.images,
      this.isActive = true});

  MProductDetail.fromJson(Map<String, dynamic> json) {
    stores = json['stores'].cast<String>();
    category = json['category'];
    subCategory = json['sub_category'].cast<String>();
    title = json['title'];
    brandManufacturer = json['brand_manufacturer'];
    productCode = json['product_code'] != null
        ? new MProductCode.fromJson(json['product_code'])
        : null;
    unitsInStoc = json['units_in_stoc'];
    description = json['description'];
    bulletPoints = json['bullet_points'].cast<String>();
    images = json['images'].cast<String>();
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stores'] = this.stores;
    data['category'] = this.category;
    data['sub_category'] = this.subCategory;
    data['title'] = this.title;
    data['brand_manufacturer'] = this.brandManufacturer;
    if (this.productCode != null) {
      data['product_code'] = this.productCode.toJson();
    }
    data['units_in_stock'] = this.unitsInStoc;
    data['description'] = this.description;
    data['bullet_points'] = this.bulletPoints;
    data['images'] = this.images;
    data['is_active'] = this.isActive;
    return data;
  }

  validate() {
    if (stores.isEmpty) {
      return "Please select stores";
    } else if (category == null) {
      return "Please select category";
    } else if (subCategory.isEmpty) {
      return "Please select subcategory";
    } else if (title == null) {
      return "Please enter product title";
    } else if (brandManufacturer == null) {
      return "Please enter brand manufecturer";
    } else if (unitsInStoc == null) {
      return "Please enter Unit in stock";
    } else if (images.isEmpty) {
      return "Please select Product images";
    } else if (description == null) {
      return "Please enter product description";
    } else if (bulletPoints.isEmpty) {
      return "Please enter bullet points";
    } else if (productCode.barcode == null || productCode.type == null) {
      return "Please enter product code and type.";
    } else {
      return null;
    }
  }
}

class MProductCode {
  String type;
  String barcode;

  MProductCode({this.type = "UPC", this.barcode = ''});

  MProductCode.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    barcode = json['barcode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['barcode'] = this.barcode;
    return data;
  }
}
