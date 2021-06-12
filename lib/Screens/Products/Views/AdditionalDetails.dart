import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdditionalDetails extends StatelessWidget {
  final data = [
    {
      "name": "Brand",
      "value": "Apple",
    },
    {
      "name": "Sold by",
      "value": "Apple Authorised Seller",
    },
    {
      "name": "Product Dimensions",
      "value": "25x8x10 cm",
    },
    {
      "name": "Item Weight",
      "value": "200 g",
    },
    {
      "name": "Category",
      "value": "Electronics",
    },
    {
      "name": "Listed on",
      "value": "13 October 2019",
    },
    {
      "name": "UPS",
      "value": "656498902",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(5)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: _createChildren(),
      ),
    );
  }

  List<Widget> _createChildren() {
    List<Widget> widgets = new List<Widget>.generate(
      data.length,
      (int index) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: AppTitle(
                textAlign: TextAlign.start,
                title: data[index]["name"],
                padding: EdgeInsets.only(left: 20, top: 2.5, bottom: 2.5),
                fontSize: AppFont.title2,
                fontWeight: AppFont.regular,
              ),
            ),
            Expanded(
              child: AppTitle(
                textAlign: TextAlign.start,
                title: data[index]["value"],
                padding: EdgeInsets.only(top: 2.5, bottom: 2.5),
                fontSize: AppFont.title2,
                fontWeight: AppFont.regular,
              ),
            ),
          ],
        );
      },
    );
    widgets.insert(
      0,
      AppTitle(
        title: "Product Additional Information",
        padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
        fontSize: AppFont.title5,
        fontWeight: AppFont.regular,
      ),
    );
    return widgets;
  }
}
