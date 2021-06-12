class CartPayment {
  double amount;
  String currency;
  String source;
  String receiptEmail;
  String obj;
  String cartId;

  CartPayment(
      {this.amount,
      this.currency,
      this.source,
      this.receiptEmail,
      this.obj,
      this.cartId});

  CartPayment.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    currency = json['currency'];
    source = json['source'];
    receiptEmail = json['receipt_email'];
    obj = json['obj'];
    cartId = json['cart_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['currency'] = this.currency;
    data['source'] = this.source;
    data['receipt_email'] = this.receiptEmail;
    data['obj'] = this.obj;
    data['cart_id'] = this.cartId;
    return data;
  }
}
