import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';

class StoreCell extends StatelessWidget {
  const StoreCell({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(Icons.location_on),
              Text(
                "Samsung Communications",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AppTitle(
                  title: "Address 1",
                  color: AppColors.lightGrey,
                  fontSize: AppFont.title2,
                ),
                AppTitle(
                  title: "Adddress 2",
                  color: AppColors.lightGrey,
                  fontSize: AppFont.title2,
                ),
                AppTitle(
                  title: "2844305",
                  color: AppColors.lightGrey,
                  fontSize: AppFont.title2,
                ),
                Divider()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
