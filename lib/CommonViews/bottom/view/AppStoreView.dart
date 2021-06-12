import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppStoreView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 20,),
        Image.asset(
          "assets/images/bottom_logo.png",
          width: 150,
        ),
        AppTitle(color: Colors.white, title: 'Our Mobile App'),
        InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            print('Card tapped.');
          },
          child: Image.asset(
            "assets/images/app-store-button.png",
            width: 100,
          ),
        ),
        InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            print('Card tapped.');
          },
          child: Image.asset(
            "assets/images/play_store_bt.png",
            width: 100,
          ),
        ),
      ],
    );
  }
}
