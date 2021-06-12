class MCardList {
  List<MCard> cards;

  MCardList({this.cards});

  MCardList.fromJson(Map<String, dynamic> json) {
    if (json['cards'] != null) {
      cards = [];
      json['cards'].forEach((v) {
        cards.add(new MCard.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cards != null) {
      data['cards'] = this.cards.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MCard {
  String brand;
  String country;
  int expMonth;
  int expYear;
  String funding;
  String id;
  String last4;
  String name;
  String object;

  MCard(
      {this.brand,
      this.country,
      this.expMonth,
      this.expYear,
      this.funding,
      this.id,
      this.last4,
      this.name,
      this.object});

  MCard.fromJson(Map<String, dynamic> json) {
    brand = json['brand'];
    country = json['country'];
    expMonth = json['exp_month'];
    expYear = json['exp_year'];
    funding = json['funding'];
    id = json['id'];
    last4 = json['last4'];
    name = json['name'];
    object = json['object'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['brand'] = this.brand;
    data['country'] = this.country;
    data['exp_month'] = this.expMonth;
    data['exp_year'] = this.expYear;
    data['funding'] = this.funding;
    data['id'] = this.id;
    data['last4'] = this.last4;
    data['name'] = this.name;
    data['object'] = this.object;
    return data;
  }
}
