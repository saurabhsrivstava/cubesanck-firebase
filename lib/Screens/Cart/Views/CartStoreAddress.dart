import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';

class CartStoreAddress extends StatelessWidget {
  const CartStoreAddress({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Icon(Icons.location_on_outlined),
          Column(
            children: [
              AppTitle(
                title: "Address 1",
                fontSize: AppFont.title3,
                color: AppColors.grey500,
              ),
              AppTitle(
                title: "Address 2",
                fontSize: AppFont.title3,
                color: AppColors.grey500,
              ),
              AppTitle(
                title: "Address 3",
                fontSize: AppFont.title3,
                color: AppColors.grey500,
              )
            ],
          )
        ],
      ),
    );
  }
}
