import 'package:cubesnack/Screens/Authentication/SellerSignup/Pages/BusinessInfo/Models/BusinessInfo.dart';

class MShipping {
  int perUnitWeight;
  int shippingWeight;
  PerUnitDimension perUnitDimension;
  PerUnitDimension shippingPackageDimensions;
  Address primaryShippingAddress;
  Address returnAddress;
  bool sameDayHomeDelivery;
  bool isReturnAddressSame;

  MShipping.init() {
    perUnitDimension = PerUnitDimension();
    shippingPackageDimensions = PerUnitDimension();
    primaryShippingAddress = Address();
    returnAddress = Address();
    isReturnAddressSame = true;
    sameDayHomeDelivery = true;
  }

  MShipping(
      {this.perUnitWeight = 0,
      this.shippingWeight = 0,
      this.perUnitDimension,
      this.shippingPackageDimensions,
      this.primaryShippingAddress,
      this.returnAddress,
      this.sameDayHomeDelivery,
      this.isReturnAddressSame = true});

  MShipping.fromJson(Map<String, dynamic> json) {
    perUnitWeight = json['per_unit_weight'];
    shippingWeight = json['shipping_weight'];
    perUnitDimension = json['per_unit_dimension'] != null
        ? new PerUnitDimension.fromJson(json['per_unit_dimension'])
        : null;
    shippingPackageDimensions = json['shipping_package_dimensions'] != null
        ? new PerUnitDimension.fromJson(json['shipping_package_dimensions'])
        : null;
    primaryShippingAddress = json['primary_shipping_address'] != null
        ? new Address.fromJson(json['primary_shipping_address'])
        : null;
    returnAddress = json['return_address'] != null
        ? new Address.fromJson(json['return_address'])
        : null;
    sameDayHomeDelivery = json['same_day_home_delivery'];
  }

  validate() {
    if (this.primaryShippingAddress != null) {
      return this.primaryShippingAddress.validate();
    } else if (this.returnAddress != null &&
        this.isReturnAddressSame == false) {
      return this.primaryShippingAddress.validate();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['per_unit_weight'] = this.perUnitWeight;
    data['shipping_weight'] = this.shippingWeight;
    if (this.perUnitDimension != null) {
      data['per_unit_dimension'] = this.perUnitDimension.toJson();
    }
    if (this.shippingPackageDimensions != null) {
      data['shipping_package_dimension'] =
          this.shippingPackageDimensions.toJson();
    }
    if (this.primaryShippingAddress != null) {
      data['primary_shipping_address'] = this.primaryShippingAddress.toJson();
    }
    if (this.returnAddress != null) {
      data['return_address'] = isReturnAddressSame
          ? this.primaryShippingAddress.toJson()
          : this.returnAddress.toJson();
    }
    data['is_same_day_home_delivery'] = this.sameDayHomeDelivery;
    return data;
  }
}

class PerUnitDimension {
  int length;
  int width;
  int height;

  PerUnitDimension({this.length = 0, this.width = 0, this.height = 0});

  PerUnitDimension.fromJson(Map<String, dynamic> json) {
    length = json['length'];
    width = json['width'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['length'] = this.length;
    data['width'] = this.width;
    data['height'] = this.height;
    return data;
  }
}
