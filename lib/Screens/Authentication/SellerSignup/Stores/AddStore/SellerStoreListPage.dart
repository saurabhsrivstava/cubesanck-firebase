import 'package:cubesnack/CommonViews/AppGroupCheckbox.dart';
import 'package:flutter/material.dart';

import 'Views/SellerStoreList.dart';

class SellerStorePage extends StatefulWidget {
  const SellerStorePage({Key key}) : super(key: key);

  @override
  _SellerStorePageState createState() => _SellerStorePageState();
}

class _SellerStorePageState extends State<SellerStorePage> {
  bool showStore = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AppGroupCheckbox(
          data: [
            "Yes",
            "No",
          ],
          title: "Do you have physical location for this business?",
          valueCallBack: (v, i) {
            this.setState(() {
              showStore = v == "Yes" ? true : false;
            });
          },
        ),
        showStore ? SellerStoreList() : Container()
      ],
    );
  }
}
