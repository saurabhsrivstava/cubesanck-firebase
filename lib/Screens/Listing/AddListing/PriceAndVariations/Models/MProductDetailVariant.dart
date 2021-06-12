class MProductDetailVariant {
  int sellingPrice;
  int discountedPrice;
  int maxOrderQuantity;
  String condition;
  String additionalConditionalDetails;
  List<MProps> variants;

  MProductDetailVariant.init() {
    this.sellingPrice = 0;
    this.discountedPrice = 0;
    this.maxOrderQuantity = 0;
    this.condition = 'New';
    this.additionalConditionalDetails = '';
    this.variants = List<MProps>();
  }

  MProductDetailVariant(
      {this.sellingPrice,
      this.discountedPrice,
      this.maxOrderQuantity,
      this.condition,
      this.additionalConditionalDetails,
      this.variants});

  validate() {
    if (sellingPrice == null) {
      return "Please enter valid selling price";
    } else if (discountedPrice == null) {
      return "Please enter valid discount price";
    } else if (maxOrderQuantity == null) {
      return "Please enter valid max order quantity";
    } else if (condition == null) {
      return "Please enter valid condition details";
    } else if (additionalConditionalDetails == null) {
      return "Please enter valid additional condition";
    }
    //  else if (variants.isEmpty) {
    //   return "Please enter valid variants";
    // }
    else {
      return null;
    }
  }

  MProductDetailVariant.fromJson(Map<String, dynamic> json) {
    sellingPrice = json['selling_price'];
    discountedPrice = json['discounted_price'];
    maxOrderQuantity = json['max_order_quantity'];
    condition = json['condition'];
    additionalConditionalDetails = json['additional_conditional_details'];
    if (json['variants'] != null) {
      variants = new List<MProps>();
      json['variants'].forEach((v) {
        variants.add(new MProps.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['selling_price'] = this.sellingPrice;
    data['discounted_price'] = this.discountedPrice;
    data['max_order_quantity'] = this.maxOrderQuantity;
    data['condition'] = this.condition.toLowerCase();
    data['additional_conditional_details'] = this.additionalConditionalDetails;
    if (this.variants != null) {
      data['variants'] = this.variants.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MProps {
  String image;
  int regularPrice;
  int salePrice;
  String sku;
  int maxOrderQuantity;
  int availableQuantity;
  List<MVariantOption> variantOption;

  MProps(
      {this.image,
      this.regularPrice,
      this.salePrice,
      this.sku,
      this.maxOrderQuantity,
      this.availableQuantity,
      this.variantOption});

  MProps.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    regularPrice = json['regular_price'];
    salePrice = json['sale_price'];
    sku = json['sku'];
    maxOrderQuantity = json['max_order_quantity'];
    availableQuantity = json['available_quantity'];
    if (json['variant_option'] != null) {
      variantOption = new List<MVariantOption>();
      json['variant_option'].forEach((v) {
        variantOption.add(new MVariantOption.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['regular_price'] = this.regularPrice;
    data['sale_price'] = this.salePrice;
    data['sku'] = this.sku;
    data['max_order_quantity'] = this.maxOrderQuantity;
    data['available_quantity'] = this.availableQuantity;
    if (this.variantOption != null) {
      data['variant_option'] =
          this.variantOption.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MVariantOption {
  String type;
  String option;

  MVariantOption({this.type, this.option});

  MVariantOption.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    option = json['option'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['option'] = this.option;
    return data;
  }
}
