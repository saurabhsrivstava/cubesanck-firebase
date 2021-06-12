class ProductListingResponse {
  List<MProductListing> productListing;

  ProductListingResponse({this.productListing});

  ProductListingResponse.fromJson(Map<String, dynamic> json) {
    if (json['productListing'] != null) {
      productListing = new List<MProductListing>();
      json['productListing'].forEach((v) {
        productListing.add(new MProductListing.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.productListing != null) {
      data['productListing'] =
          this.productListing.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MProductListing {
  String title;
  int rating;
  dynamic price;
  MImage image;
  String id;

  MProductListing({this.title, this.rating, this.price, this.image});

  MProductListing.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    rating = json['rating'];
    price = json['price'];
    image = json['image'] != null ? new MImage.fromJson(json['image']) : null;
    id = json["id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['rating'] = this.rating;
    data['price'] = this.price;
    if (this.image != null) {
      data['image'] = this.image.toJson();
    }
    return data;
  }
}

class MImage {
  String image;
  bool isActive;

  MImage({this.image, this.isActive});

  MImage.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['is_active'] = this.isActive;
    return data;
  }
}
