import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';

import 'AppTitle.dart';

class AppRadioButton extends StatefulWidget {
  final String title;
  final Function valueCallBack;
  const AppRadioButton({Key key, this.title = '', this.valueCallBack})
      : super(key: key);

  @override
  _AppRadioButtonState createState() => _AppRadioButtonState();
}

class _AppRadioButtonState extends State<AppRadioButton> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Radio(
              value: false,
              toggleable: true,
              groupValue: value,
              onChanged: (v) {
                this.setState(() {
                  value = !value;
                  this.widget.valueCallBack(value);
                });
              }),
          AppTitle(
            title: this.widget.title,
            fontSize: AppFont.title1,
          )
        ],
      ),
    );
  }
}
