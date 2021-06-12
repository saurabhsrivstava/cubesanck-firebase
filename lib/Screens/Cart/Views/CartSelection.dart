import 'package:cubesnack/CommonViews/AppGroupCheckbox.dart';
import 'package:flutter/material.dart';

class CartSelection extends StatelessWidget {
  const CartSelection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AppGroupCheckbox(
        data: [""],
        valueCallBack: (v, i) {},
        title: "Applyy this selection to all items in this cart",
      ),
    );
  }
}
