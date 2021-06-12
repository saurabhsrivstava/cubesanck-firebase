import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';

class ReturnExchangeCondition extends StatelessWidget {
  final data = [
    {
      "value":
          "it is determined that the product was not damaged while in your possession;",
    },
    {
      "value": "the product is not different from what was shipped to you;",
    },
    {
      "value":
          "the product is returned in original condition (with brand’s/manufacturer's box, MRP tag intact, user manual, warranty card and all the accessories therein).",
    },
    {
      "value":
          "Products may be eligible for replacement only if the same seller has the exact same item in stock.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.only(left: 20, bottom: 10),
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.check_box_outline_blank,
              color: AppColors.grey500,
              size: 15,
            ),
            SizedBox(
              width: 5,
            ),
            Flexible(
              child: AppTitle(
                title: data[index]["value"],
                maxLines: 5,
                fontSize: AppFont.title2,
                fontWeight: AppFont.regular,
                textAlign: TextAlign.left,
                padding: EdgeInsets.only(top: 3, bottom: 3),
              ),
            ),
          ],
        );
      },
    );
    widgets.insert(
      0,
      AppTitle(
        title: "Return Exchange Condition",
        padding: EdgeInsets.only(top: 10, bottom: 10),
        fontSize: AppFont.title5,
        fontWeight: AppFont.regular,
      ),
    );
    widgets.insert(
      1,
      AppTitle(
        title: "30 DAYS FOR RETURNS",
        padding: EdgeInsets.only(top: 10, bottom: 10),
        fontSize: AppFont.title3,
        fontWeight: AppFont.regular,
      ),
    );
    widgets.insert(
      1,
      AppTitle(
        title: "Return and exchange is available in 16 days for this products",
        padding: EdgeInsets.only(bottom: 10),
        fontSize: AppFont.title2,
        fontWeight: AppFont.regular,
      ),
    );
    return widgets;
  }
}
