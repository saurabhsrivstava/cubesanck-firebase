import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Stores/ViewEditStore/SellerViewEditStore.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';

import 'StoreCell.dart';

class SellerStoreList extends StatefulWidget {
  const SellerStoreList({Key key}) : super(key: key);

  @override
  _SellerStoreListState createState() => _SellerStoreListState();
}

class _SellerStoreListState extends State<SellerStoreList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[400]),
              borderRadius: BorderRadius.circular(5)),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return StoreCell();
            },
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 5,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            AppTitle(
              title: "Add more locations",
              fontSize: AppFont.title4,
            ),
            IconButton(
              icon: Icon(
                Icons.add_box,
                color: AppColors.darkBlue,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SellerViewEditStore(
                              title: "Add Store",
                            )));
              },
            )
          ],
        )
      ],
    );
  }
}
