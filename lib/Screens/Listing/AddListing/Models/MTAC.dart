class MTAC {
  bool isReturnAccepted;
  int days = 5;
  List<String> conditionsAcceptingReturns;
  WarrantyInformation warrantyInformation;
  String legalDisclaimer;

  MTAC.init() {
    conditionsAcceptingReturns = List<String>();
    warrantyInformation = WarrantyInformation();
    isReturnAccepted = true;
  }

  MTAC(
      {this.isReturnAccepted,
      this.days,
      this.conditionsAcceptingReturns,
      this.warrantyInformation,
      this.legalDisclaimer});

  validate() {
    if (conditionsAcceptingReturns.isEmpty) {
      return "Please enter valid return conditions";
    } else if (warrantyInformation.document == null ||
        warrantyInformation.information == null) {
      return "Please enter valid warranty details";
    } else if (legalDisclaimer == null) {
      return "Please enter valid discloser";
    } else if (days == null) {
      return "Please enter valid days";
    }
  }

  MTAC.fromJson(Map<String, dynamic> json) {
    isReturnAccepted = json['is_return_accepted'];
    days = json['days'];
    conditionsAcceptingReturns =
        json['conditions_accepting_returns'].cast<String>();
    warrantyInformation = json['warranty_information'] != null
        ? new WarrantyInformation.fromJson(json['warranty_information'])
        : null;
    legalDisclaimer = json['legal_disclaimer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_return_accepted'] = this.isReturnAccepted;
    data['days'] = this.days;
    data['conditions_accepting_returns'] = this.conditionsAcceptingReturns;
    if (this.warrantyInformation != null) {
      data['warranty_information'] = this.warrantyInformation.toJson();
    }
    data['legal_disclaimer'] = this.legalDisclaimer;
    return data;
  }
}

class WarrantyInformation {
  String document;
  String information;

  WarrantyInformation({this.document, this.information});

  WarrantyInformation.fromJson(Map<String, dynamic> json) {
    document = json['document'];
    information = json['information'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['document'] = this.document;
    data['information'] = this.information;
    return data;
  }
}
