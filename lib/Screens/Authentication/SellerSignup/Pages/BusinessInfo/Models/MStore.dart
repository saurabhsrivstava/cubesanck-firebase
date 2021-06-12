import 'package:cubesnack/Screens/Authentication/SellerSignup/Pages/BusinessInfo/Models/BusinessInfo.dart';
import 'package:cubesnack/Constants/AppExtensions.dart';

class MStore {
  String buisnessName;
  String displayName;
  String logo;
  Address address;
  List<String> documents;
  List<String> frontImages;
  String buisnessDescription = '';
  bool hasStoreManager;
  String managerEmailAddress = '';
  String managerName = '';
  String managerPassword = '';
  bool hasManageOrder;
  bool hasManageInventory;
  bool hasManageListing;
  bool hasFullAccess;
  bool isStorePickup;
  List<MBuisnessHours> buisnessHours;
  bool isSameDayDelivery;
  int maxDistance;
  int extraDeliveryCharge = 0;
  int minOrderAmount = 0;
  bool isFreeShiping;
  bool status;
  String id;

  MStore.init() {
    buisnessHours = [
      MBuisnessHours(day: "sunday", startTime: "9:00 AM", endTime: "8:00 PM"),
      MBuisnessHours(day: "monday", startTime: "9:00 AM", endTime: "8:00 PM"),
      MBuisnessHours(day: "tuesday", startTime: "9:00 AM", endTime: "8:00 PM"),
      MBuisnessHours(
          day: "wednesday", startTime: "9:00 AM", endTime: "8:00 PM"),
      MBuisnessHours(day: "thursday", startTime: "9:00 AM", endTime: "8:00 PM"),
      MBuisnessHours(day: "friday", startTime: "9:00 AM", endTime: "8:00 PM"),
      MBuisnessHours(day: "saturday", startTime: "9:00 AM", endTime: "8:00 PM")
    ];
    documents = List<String>();
    frontImages = List<String>();
    address = Address();
    hasManageOrder = false;
    hasManageInventory = false;
    hasManageListing = false;
    hasFullAccess = false;
    isStorePickup = false;
    isSameDayDelivery = false;
    isFreeShiping = false;
    status = false;
    hasStoreManager = false;
    maxDistance = 5;
  }

  validate() {
    if (this.buisnessName.isNull()) {
      return "validBName";
    } else if (this.displayName.isNull()) {
      return "validStoreName";
    } else if (this.address != null) {
      return this.address.validate();
    } else if (this.managerName != null) {
      return "validManagerName";
    } else if (this.managerEmailAddress != null) {
      return "validManagerEmail";
    } else if (this.managerPassword != null) {
      return "validManagerPassword";
    } else {
      return null;
    }
  }

  MStore(
      {this.buisnessName,
      this.displayName,
      this.logo,
      this.address,
      this.documents,
      this.frontImages,
      this.buisnessDescription,
      this.hasStoreManager,
      this.managerEmailAddress,
      this.managerPassword,
      this.hasManageOrder,
      this.hasManageInventory,
      this.hasManageListing,
      this.hasFullAccess,
      this.isStorePickup,
      this.buisnessHours,
      this.isSameDayDelivery,
      this.maxDistance,
      this.extraDeliveryCharge,
      this.minOrderAmount,
      this.isFreeShiping,
      this.status,
      this.id});

  MStore.fromJson(Map<String, dynamic> json) {
    buisnessName = json['buisness_name'];
    displayName = json['display_name'];
    logo = json['logo'];
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    documents =
        json.containsKey("documents") ? json['documents'].cast<String>() : [];
    frontImages = json.containsKey("front_images")
        ? json['front_images'].cast<String>()
        : [];
    buisnessDescription = json['buisness_description'] ?? "";
    hasStoreManager = json['has_store_manager'] ?? false;
    managerEmailAddress = json['manager_email_address'] ?? "";
    managerPassword = json['manager_password'] ?? "";
    hasManageOrder = json['has_manage_order'] ?? false;
    hasManageInventory = json['has_manage_inventory'] ?? false;
    hasManageListing = json['has_manage_listing'] ?? false;
    hasFullAccess = json['has_full_access'] ?? false;
    isStorePickup = json['is_store_pickup'] ?? false;
    if (json['business_hours'] != null) {
      buisnessHours = new List<MBuisnessHours>();
      json['business_hours'].forEach((v) {
        buisnessHours.add(new MBuisnessHours.fromJson(v));
      });
    }
    isSameDayDelivery = json['is_same_day_delivery'] ?? false;
    maxDistance = json['max_distance'] ?? 0;
    extraDeliveryCharge = json['extra_delivery_charge'] ?? 0;
    minOrderAmount = json['min_order_amount'] ?? 0;
    isFreeShiping = json['is_free_shiping'] ?? false;
    status = json['status'] ?? false;
    id = json['id'];
  }
  filterData() {
    this.documents.toSet().toList();
    this.frontImages.toSet().toList();
    this.buisnessHours?.forEach((e) {
      e.startTime = e.startTime.contains("AM") || e.startTime.contains("PM")
          ? e.startTime.time24String()
          : e.startTime;
      e.endTime = e.endTime.contains("AM") || e.endTime.contains("PM")
          ? e.endTime.time24String()
          : e.endTime;
    });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['buisness_name'] = this.buisnessName;
    data['display_name'] = this.displayName;
    data['logo'] = this.logo;
    if (this.address != null) {
      data['address'] = this.address.toJson();
    }
    data['documents'] = this.documents;
    data['front_images'] = this.frontImages;
    data['buisness_description'] = this.buisnessDescription;
    data['has_store_manager'] = this.hasStoreManager;
    data['manager_email_address'] =
        hasStoreManager ? this.managerEmailAddress : null;
    data['manager_username'] = this.managerName;
    data['manager_password'] = hasStoreManager ? this.managerPassword : null;
    data['has_manage_order'] = this.hasManageOrder;
    data['has_manage_inventory'] = this.hasManageInventory;
    data['has_manage_listing'] = this.hasManageListing;
    data['has_full_access'] = this.hasFullAccess;
    data['is_store_pickup'] = this.isStorePickup;
    if (this.buisnessHours != null) {
      data['buisness_hours'] =
          this.buisnessHours.map((v) => v.toJson()).toList();
    }
    data['is_same_day_delivery'] = this.isSameDayDelivery;
    data['max_distance'] = this.maxDistance;
    data['extra_delivery_charge'] = this.extraDeliveryCharge;
    data['min_order_amount'] = this.minOrderAmount;
    data['is_free_shiping'] = this.isFreeShiping;
    data['status'] = this.status;
    return data;
  }
}

class MBuisnessHours {
  String day;
  String startTime;
  String endTime;
  bool isOpen;

  MBuisnessHours({this.day, this.startTime, this.endTime, this.isOpen = true});

  MBuisnessHours.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    isOpen = true;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    return data;
  }
}
