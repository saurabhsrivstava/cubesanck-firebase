import 'package:cubesnack/Constants/AppExtensions.dart';

class PersonalInfo {
  String firstName;
  String lastName;
  String email;
  String dob;
  Address address;
  String photoIdPath;
  PersonalInfo(
      {this.firstName,
      this.lastName,
      this.email,
      this.dob,
      this.address,
      this.photoIdPath});
  PersonalInfo.init() {
    dob = "${DateTime.now().toLocal()}".split(' ')[0];
    address = Address();
    lastName = '';
  }

  validate() {
    if (this.firstName.isNull()) {
      return "validFName";
    } else if (this.email.isNull()) {
      return "validEmail";
    } else if (this.dob.isNull()) {
      return "validDOB";
    } else if (this.address != null) {
      return this.address.validate();
    } else {
      return null;
    }
  }

  Map<String, dynamic> toJson() => {
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'd_o_b': dob,
        'phone_number': address.phone,
        'address': address.toJson(),
        'photo_id': this.photoIdPath
      };
}

class BusinessInfo {
  String businessName;
  Address businessAddress;
  String businessDesc;
  bool isPhysicalLocation;
  List<Address> locations;
  ShippingSetting shippingSetting;
  BusinessInfo(
      {this.businessName,
      this.businessAddress,
      this.businessDesc,
      this.isPhysicalLocation,
      this.locations,
      this.shippingSetting});
  BusinessInfo.init() {
    businessAddress = Address();
    locations = List<Address>();
    shippingSetting = ShippingSetting();
    isPhysicalLocation = false;
  }
  validate() {
    if (this.businessName.isNull()) {
      return "Valid first name required";
    } else if (this.businessAddress != null) {
      return this.businessAddress.validate();
    } else {
      return null;
    }
  }

  Map<String, dynamic> toJson() => {
        'legal_name': businessName,
        'description': businessDesc,
        'is_free_return': shippingSetting.isFreeReturn,
        'is_free_shipping': shippingSetting.isFreeShipping,
        'is_physical_retail_location': isPhysicalLocation,
        'phone_number': businessAddress.phone,
        'address': businessAddress.toJson(),
        'physical_stores': []
      };

  BusinessInfo.fromJson(Map<String, dynamic> json) {
    shippingSetting = ShippingSetting();
    businessName = json["legal_name"];
    businessDesc = json["description"];
    shippingSetting.isFreeReturn = json["is_free_return"];
    shippingSetting.isFreeShipping = json["is_free_shipping"];
    isPhysicalLocation = json["is_physical_retail_location"];
    //locations = json["physical_stores"];
    businessAddress = Address.fromJson(json["address"]);
    businessAddress.phone = json["phone_number"];
  }
}

class ShippingSetting {
  bool isFreeReturn;
  bool isFreeShipping;
  ShippingSetting({this.isFreeReturn = false, this.isFreeShipping = false});
}

class TaxInfo {
  String name;
  String businessName;
  Address address;
  String taxId;
  TaxInfo({this.name, this.businessName, this.address, this.taxId});
  TaxInfo.init() {
    address = Address();
  }

  validate() {
    if (this.name.isNull()) {
      return "validateName";
    } else if (this.businessName.isNull()) {
      return "validateBusinessName";
    } else if (this.taxId.isNull()) {
      return "validateTaxId";
    } else if (this.address != null) {
      return this.address.validate();
    } else {
      return null;
    }
  }

  Map<String, dynamic> toJson() => {
        'name_on_income_tax': name,
        'buisness_name': businessName,
        'address': address.toJson(),
        'tax_id': taxId,
      };
}

class Address {
  String address1;
  String address2;
  String city;
  String state;
  String zip;
  String phone;
  String id;
  Address(
      {this.address1,
      this.address2 = '',
      this.city,
      this.state,
      this.zip,
      this.phone = ''});
  validate() {
    if (this.address1.isNull()) {
      return "validateAddress";
    } else if (this.city.isNull()) {
      return "validateCity";
    } else if (this.state.isNull()) {
      return "validateState";
    } else if (this.zip.isNull()) {
      return "validateZip";
    } else {
      return null;
    }
  }

  reset() {
    address1 = "";
    address2 = "";
    city = "";
    state = "";
    zip = "";
    phone = "";
    id = "";
  }

  Map<String, dynamic> toJson() => {
        'street': address1,
        'line_2': address2,
        'city': city,
        'state': state,
        'zipcode': zip,
      };

  Address.fromJson(Map<String, dynamic> json) {
    address1 = json["street"];
    address2 = json["line_2"];
    city = json["city"];
    state = json["state"];
    zip = json["zipcode"];
    id = json["id"];
  }
}

class MUserAddress {
  String name;
  Address address;
  String id;
  bool isDefault = true;

  MUserAddress.init() {
    address = Address();
  }

  validate() {
    if (name.isNull()) {
      return "Enter Validate Name";
    } else if (address.validate() != null) {
      return address.validate();
    } else {
      return null;
    }
  }

  MUserAddress({this.name, this.address, this.isDefault, this.id});

  MUserAddress.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    isDefault = json['is_default'];
    id = json["id"];
    address.phone = json["phone"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.address != null) {
      data['address'] = this.address.toJson();
    }
    data['is_default'] = this.isDefault;
    data["id"] = this.id;
    data["phone"] = this.address.phone;
    return data;
  }
}

class MUserAddressResponse {
  List<MUserAddress> address;

  MUserAddressResponse({this.address});

  MUserAddressResponse.fromJson(Map<String, dynamic> json) {
    if (json['address'] != null) {
      address = new List<MUserAddress>();
      json['address'].forEach((v) {
        address.add(new MUserAddress.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.address != null) {
      data['address'] = this.address.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
