import 'package:cubesnack/CommonViews/AppRoundButton.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartCoupon extends StatefulWidget {
  const CartCoupon({Key key}) : super(key: key);

  @override
  _CartCouponState createState() => _CartCouponState();
}

class _CartCouponState extends State<CartCoupon> {
  final options = ["Credit/Debit", "Net Banking", "Wallet", "Cash On Delivery"];
  int selceteIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Flexible(
                child: TextField(
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: "Add Promo Code",
                    fillColor: Colors.grey[200],
                    filled: true,
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(width: 20,),
              AppRoundButton(
                radius: 0,
                width: 120,
                title: "Apply Code",
                isRightIcon: false,
                isLocalised: false,
                backgroundColor: AppColors.darkBlue,
                borderColor: AppColors.darkBlue,
                titleColor: Colors.white,
                isBorder: true,
                onPressed: () => Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
