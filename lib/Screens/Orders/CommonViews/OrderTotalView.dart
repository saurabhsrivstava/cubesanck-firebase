import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Screens/Orders/Models/MOrderResponse.dart';
import 'package:flutter/material.dart';

class OrderTotalView extends StatelessWidget {
  final MOrder order;
  const OrderTotalView({Key key, this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double subTotal = 0.0;
    double total = 0.0;
    order.items.forEach((element) {
      subTotal = element.sellingPrice * element.quantity + subTotal;
    });
    total = subTotal; // Add delivery charge.
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Spacer(),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                      child: AppTitle(
                    title: "Sub Total:",
                    textAlign: TextAlign.right,
                  )),
                  Expanded(
                      child: AppTitle(
                    title: "\$$subTotal",
                    textAlign: TextAlign.right,
                  ))
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                      child: AppTitle(
                    title: "Tax:",
                    textAlign: TextAlign.right,
                  )),
                  Expanded(
                      child: AppTitle(
                    title: "\$0",
                    textAlign: TextAlign.right,
                  ))
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                      child: AppTitle(
                    title: "Order Total:",
                    textAlign: TextAlign.right,
                  )),
                  Expanded(
                      child: AppTitle(
                    title: "\$$total",
                    textAlign: TextAlign.right,
                  ))
                ],
              ),
            ],
          ),
        ),
        SizedBox(width: 20)
      ],
    );
  }
}
