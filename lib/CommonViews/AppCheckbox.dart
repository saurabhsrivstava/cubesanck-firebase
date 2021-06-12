import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';

class AppCheckbox extends StatefulWidget {
  final String title;
  final EdgeInsets margin;
  final Function valueCallBack;
  final bool value;
  const AppCheckbox(
      {Key key,
      this.title = "",
      this.margin,
      @required this.valueCallBack,
      this.value = false})
      : super(key: key);

  @override
  _AppCheckboxState createState() => _AppCheckboxState();
}

class _AppCheckboxState extends State<AppCheckbox> {
  bool value = false;

  @override
  void initState() {
    value = this.widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: this.widget.margin,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            height: 20,
            width: 20,
            child: Checkbox(
              value: value,
              onChanged: (v) {
                this.setState(() {
                  value = v;
                  this.widget.valueCallBack(v);
                });
              },
            ),
          ),
          AppTitle(
            title: this.widget.title,
            fontSize: AppFont.title2,
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
