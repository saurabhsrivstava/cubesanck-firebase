import 'package:cubesnack/CommonViews/MultiTitle.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';
import 'AppTitle.dart';

class AppDropdown extends StatefulWidget {
  final double height;
  final List<String> data;
  final String hintText;
  final Function valueCallBack;
  final String defaultValue;
  final double top;
  final double bottom;
  final String title;
  final String subTitle;
  final double fontSize;
  const AppDropdown(
      {Key key,
      this.height = 45,
      @required this.data,
      this.hintText = '',
      this.defaultValue,
      this.valueCallBack,
      this.title,
      this.top = 0,
      this.bottom = 0,
      this.subTitle = '',
      this.fontSize = 15})
      : super(key: key);

  @override
  _AppDropdownState createState() => _AppDropdownState();
}

class _AppDropdownState extends State<AppDropdown> {
  String _value;
  @override
  void initState() {
    _value = this.widget.defaultValue ?? widget.data.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: this.widget.top, bottom: this.widget.bottom),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          this.widget.title != null
              ? MultiTitle(
                  title: AppTitle(
                    title: this.widget.title,
                    fontSize: AppFont.title2,
                  ),
                  subTitle: AppTitle(
                    title: this.widget.subTitle,
                    fontSize: AppFont.title1,
                  ),
                  bottom: 5,
                )
              : Container(),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 10, right: 10),
            margin: EdgeInsets.only(bottom: this.widget.bottom),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.greyBorder,
              ),
              borderRadius: BorderRadius.circular(2),
            ),
            height: widget.height,
            child: new DropdownButton<String>(
              value: _value,
              isExpanded: true,
              hint: Text(this.widget.hintText),
              underline: Container(),
              items: widget.data.map((String value) {
                return new DropdownMenuItem<String>(
                  value: value,
                  child: new Text(
                    value,
                    style: TextStyle(fontSize: this.widget.fontSize),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                this.setState(() {
                  _value = value;
                  final index = this.widget.data.indexOf(value);
                  this.widget.valueCallBack(value, index);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
