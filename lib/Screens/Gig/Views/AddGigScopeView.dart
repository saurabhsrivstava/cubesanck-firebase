import 'package:cubesnack/CommonViews/AppGroupCheckbox.dart';
import 'package:flutter/material.dart';

import 'GigCustomScope.dart';

class AddGigScopeView extends StatelessWidget {
  const AddGigScopeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        children: [
          AppGroupCheckbox(
              data: ["Single Packages", "3 Packages"],
              title: "Choose Package Type*"),
          GigCustomScope()
        ],
      ),
    );
  }
}
