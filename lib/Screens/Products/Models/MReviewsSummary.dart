class MReviewsSummary {
  int excellent;
  int good;
  int average;
  int belowAverage;
  int poor;
  int totalAvg;

  MReviewsSummary(
      {this.excellent,
      this.good,
      this.average,
      this.belowAverage,
      this.poor,
      this.totalAvg});

  MReviewsSummary.fromJson(Map<String, dynamic> json) {
    excellent = json['excellent'];
    good = json['good'];
    average = json['average'];
    belowAverage = json['below_average'];
    poor = json['poor'];
    totalAvg = (excellent + good + average + belowAverage + poor);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['excellent'] = this.excellent;
    data['good'] = this.good;
    data['average'] = this.average;
    data['below_average'] = this.belowAverage;
    data['poor'] = this.poor;
    return data;
  }
}
