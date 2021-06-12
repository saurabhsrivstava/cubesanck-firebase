class FastShippingResponse {
  List<FastShipping> items;

  FastShippingResponse({this.items});

  FastShippingResponse.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = new List<FastShipping>();
      json['items'].forEach((v) {
        items.add(new FastShipping.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FastShipping {
  String carrier;
  String carrierAccountId;
  String createdAt;
  String currency;
  String deliveryDate;
  bool deliveryDateGuaranteed;
  int deliveryDays;
  int estDeliveryDays;
  String id;
  String listCurrency;
  double listRate;
  String mode;
  String object;
  double rate;
  String retailCurrency;
  double retailRate;
  String service;
  String shipmentId;
  String updatedAt;

  FastShipping(
      {this.carrier,
      this.carrierAccountId,
      this.createdAt,
      this.currency,
      this.deliveryDate,
      this.deliveryDateGuaranteed,
      this.deliveryDays,
      this.estDeliveryDays,
      this.id,
      this.listCurrency,
      this.listRate,
      this.mode,
      this.object,
      this.rate,
      this.retailCurrency,
      this.retailRate,
      this.service,
      this.shipmentId,
      this.updatedAt});

  FastShipping.fromJson(Map<String, dynamic> json) {
    carrier = json['carrier'];
    carrierAccountId = json['carrier_account_id'];
    createdAt = json['created_at'];
    currency = json['currency'];
    deliveryDate = json['delivery_date'];
    deliveryDateGuaranteed = json['delivery_date_guaranteed'];
    deliveryDays = json['delivery_days'];
    estDeliveryDays = json['est_delivery_days'];
    id = json['id'];
    listCurrency = json['list_currency'];
    listRate = json['list_rate'];
    mode = json['mode'];
    object = json['object'];
    rate = json['rate'];
    retailCurrency = json['retail_currency'];
    retailRate = json['retail_rate'];
    service = json['service'];
    shipmentId = json['shipment_id'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['carrier'] = this.carrier;
    data['carrier_account_id'] = this.carrierAccountId;
    data['created_at'] = this.createdAt;
    data['currency'] = this.currency;
    data['delivery_date'] = this.deliveryDate;
    data['delivery_date_guaranteed'] = this.deliveryDateGuaranteed;
    data['delivery_days'] = this.deliveryDays;
    data['est_delivery_days'] = this.estDeliveryDays;
    data['id'] = this.id;
    data['list_currency'] = this.listCurrency;
    data['list_rate'] = this.listRate;
    data['mode'] = this.mode;
    data['object'] = this.object;
    data['rate'] = this.rate;
    data['retail_currency'] = this.retailCurrency;
    data['retail_rate'] = this.retailRate;
    data['service'] = this.service;
    data['shipment_id'] = this.shipmentId;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
