import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';

class DropDownMenu extends StatefulWidget {
  final List<String> items;
  final String title;
  final int elevation;
  final EdgeInsetsGeometry padding;
  final bool isExpanded;

  const DropDownMenu(
      {this.items,
      this.title,
      this.elevation = 8,
      this.isExpanded = false,
      this.padding = const EdgeInsets.all(0),
      Key key})
      : super(key: key);

  @override
  _DropDownDemoState createState() => _DropDownDemoState();
}

class _DropDownDemoState extends State<DropDownMenu> {
  String _chosenValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: this.widget.padding,
      child: DropdownButton<String>(
        elevation: this.widget.elevation,
        isExpanded: this.widget.isExpanded,
        value: _chosenValue,
        underline: Container(),
        icon: Icon(
          Icons.keyboard_arrow_down,
          color: Colors.grey,
        ),
        //elevation: 5,
        style: TextStyle(color: Colors.black),

        items: this.widget.items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        hint: AppTitle(
          padding: EdgeInsets.only(left: 10, right: 10),
          title: this.widget.title,
          color: Colors.grey,
          fontSize: AppFont.title3,
          fontWeight: AppFont.regular,
        ),
        onChanged: (String value) {
          setState(() {
            _chosenValue = value;
          });
        },
      ),
    );
  }
}
