import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StorePolicy extends StatelessWidget {
  final data = [
    {
      "name": "Return",
      "icon": SvgPicture.asset(
        "assets/images/return.svg",
        width: 30,
        height: 30,
      ),
    },
    {
      "name": "Warranty",
      "icon": SvgPicture.asset(
        "assets/images/warranty.svg",
        width: 30,
        height: 30,
      ),
    },
    {
      "name": "Legal",
      "icon": SvgPicture.asset(
        "assets/images/legal.svg",
        width: 30,
        height: 30,
      ),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return
        // Container(
        // decoration: BoxDecoration(
        //     color: Colors.grey[200], borderRadius: BorderRadius.circular(5)),
        // child:
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
          AppTitle(
            title: "Store Policy",
            padding: EdgeInsets.only(top: 10, bottom: 10),
            fontSize: AppFont.title5,
            fontWeight: AppFont.regular,
          ),
          Row(
            children: _createChildren(),
          )
        ]
            // ),
            );
  }

  List<Widget> _createChildren() {
    return new List<Widget>.generate(
      data.length,
      (int index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                margin: EdgeInsets.only(left: 10, right: 10),
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                shadowColor: Colors.grey,
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    print('Card tapped.');
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: data[index]["icon"],
                  ),
                )),
            AppTitle(
              title: data[index]["name"],
              padding: EdgeInsets.only(top: 5, bottom: 10),
              fontSize: AppFont.title2,
              fontWeight: AppFont.regular,
            ),
          ],
        );
      },
    );
  }
}
