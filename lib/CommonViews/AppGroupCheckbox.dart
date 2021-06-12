import 'package:cubesnack/Constants/AppEnums.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';
import 'AppTitle.dart';

class AppGroupCheckbox extends StatefulWidget {
  final List<String> data;
  final String title;
  final Function valueCallBack;
  final double top;
  final double bottom;
  final String value;
  final GroupCheckType type;

  const AppGroupCheckbox(
      {Key key,
      @required this.data,
      @required this.title,
      this.valueCallBack,
      this.top = 15,
      this.bottom = 0,
      this.value,
      this.type = GroupCheckType.horizontal})
      : super(key: key);

  @override
  _AppGroupCheckboxState createState() => _AppGroupCheckboxState();
}

class _AppGroupCheckboxState extends State<AppGroupCheckbox> {
  String value;

  @override
  void initState() {
    super.initState();
    value =
        this.widget.value != null ? this.widget.value : this.widget.data.first;
  }

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: this.widget.top, bottom: this.widget.bottom),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          this.widget.title.length > 0
              ? AppTitle(
                  title: this.widget.title,
                  fontSize: AppFont.title3,
                  textAlign: TextAlign.start,
                )
              : Container(),
          this.widget.type == GroupCheckType.horizontal
              ? Row(
                  children: <Widget>[..._getOptions()],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[..._getOptions()],
                ),
        ],
      ),
    );
  }

  _getOptions() {
    List<Widget> options = List<Widget>();
    this
        .widget
        .data
        .map((d) => options.add(_CheckBox(
              isSelected: value == d,
              valueChange: _valueChange,
              title: d,
            )))
        .toList();
    return options;
  }

  _valueChange(v) {
    this.widget.valueCallBack(v, this.widget.data.indexOf(v));
    this.setState(() {
      value = v;
    });
  }
}

class _CheckBox extends StatelessWidget {
  final bool isSelected;
  final String title;
  final Function valueChange;
  const _CheckBox(
      {Key key, this.isSelected, this.title, @required this.valueChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(right: 15, top: 10),
        child: Row(
          children: <Widget>[
            isSelected
                ? Icon(
                    Icons.check_circle,
                    //size: 22,
                    color: Colors.blue,
                  )
                : Container(
                    height: 21,
                    width: 21,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.5),
                        border: Border.all(
                          color: Colors.grey,
                        )),
                  ),
            SizedBox(
              width: 5,
            ),
            AppTitle(
              title: title,
              color: AppColors.lightGrey,
              fontSize: AppFont.title2,
            )
          ],
        ),
      ),
      onTap: () => valueChange(title),
    );
  }
}
