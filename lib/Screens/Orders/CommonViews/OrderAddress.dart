import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';

class OrderAddress extends StatelessWidget {
  final String title;
  final String line1;
  final String line2;
  final String email;
  final String phone;

  const OrderAddress(
      {Key key,
      this.title = "",
      this.line2 = "",
      this.line1,
      this.email,
      this.phone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTitle(
          title: title,
          fontWeight: FontWeight.w600,
          fontSize: AppFont.title2,
        ),
        SizedBox(height: 5),
        AppTitle(
          title: line1,
          fontSize: AppFont.title1,
        ),
        AppTitle(
          title: line2,
          fontSize: AppFont.title1,
        ),
        SizedBox(height: 10),
        if (email != null)
          AppTitle(
            title: "Email: $email",
            fontSize: AppFont.title1,
          ),
        if (phone != null)
          AppTitle(
            title: "Phone: $phone",
            fontSize: AppFont.title1,
          )
      ],
    );
  }
}
