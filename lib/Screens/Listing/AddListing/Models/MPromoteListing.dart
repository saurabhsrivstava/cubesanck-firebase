class MPromoteListing {
  bool isPromoted;
  String startDate;
  String endDate;
  int dailyBudget;

  MPromoteListing(
      {this.isPromoted = true,
      this.startDate,
      this.endDate,
      this.dailyBudget = 0});

  MPromoteListing.fromJson(Map<String, dynamic> json) {
    isPromoted = json['is_promoted'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    dailyBudget = json['daily_budget'];
  }

  validate() {
    if (startDate == null) {
      return "Please enter valida start date";
    } else if (endDate == null) {
      return "Please enter valida end date";
    } else if (dailyBudget == null) {
      return "Please enter valida daily budget";
    } else {
      return null;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_promoted'] = this.isPromoted;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['daily_budget'] = this.dailyBudget;
    return data;
  }
}
