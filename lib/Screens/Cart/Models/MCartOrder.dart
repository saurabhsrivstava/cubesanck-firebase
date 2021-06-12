class MCartOrder {
  double orderDetails = 0.0;
  double savings = 0.0;
  double taxes = 0.0;
  double extraDeliveryCharge = 0.0;
  String cartId;

  get total => orderDetails + taxes + extraDeliveryCharge;
}
