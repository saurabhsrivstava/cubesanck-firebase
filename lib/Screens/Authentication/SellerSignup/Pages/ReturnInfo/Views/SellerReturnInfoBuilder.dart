import 'package:cubesnack/Screens/Authentication/SellerSignup/Pages/ReturnInfo/Views/SellerReturnInfoCell.dart';
import 'package:cubesnack/Screens/Products/Models/MReturn.dart';
import 'package:flutter/material.dart';

class SellerReturnInfoBuilder extends StatelessWidget {
  final List<MReturn> items;
  const SellerReturnInfoBuilder({Key key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 900,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return SellerReturnInfoCell(item: items[index]);
          },
          itemCount: items != null ? items.length : 0,
        ));
  }
}
