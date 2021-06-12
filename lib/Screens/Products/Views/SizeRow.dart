import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SizeRow extends StatelessWidget {
  SizeRow({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Column(
        children: [
          Row(
            children: [
              AppTitle(
                title: "Size (UK) ",
                fontSize: AppFont.title3,
                fontWeight: AppFont.medium,
                color: AppColors.grey600,
                padding: EdgeInsets.only(bottom: 10),
              ),
              Spacer(),
              AppTitle(
                padding: EdgeInsets.only(bottom: 10),
                title: "Size Chart",
                fontSize: AppFont.title2,
                fontWeight: AppFont.medium,
                color: AppColors.darkBlue,
              )
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(color: AppColors.blue)),
                height: 50,
                width: 50,
                child: AppTitle(
                  title: "6.0",
                ),
              ),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(color: AppColors.greyBorder)),
                height: 50,
                width: 50,
                child: AppTitle(
                  title: "7.0",
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
