import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';
import 'AppTitle.dart';

class AppCalendarButton extends StatefulWidget {
  final String title;
  final Function callBack;
  const AppCalendarButton({Key key, this.callBack, this.title})
      : super(key: key);

  @override
  _AppCalendarButtonState createState() => _AppCalendarButtonState();
}

class _AppCalendarButtonState extends State<AppCalendarButton> {
  DateTime selectedDate = DateTime.now();
  String dateToSend;

  @override
  void initState() {
    dateToSend = "${selectedDate.toLocal()}".split(' ')[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AppTitle(
            title: this.widget.title,
            fontWeight: FontWeight.w500,
            fontSize: AppFont.title3,
            isLocalised: true,
          ),
          InkWell(
            onTap: () async {
              final DateTime picked = await showDatePicker(
                  context: context,
                  initialDate: selectedDate,
                  firstDate: DateTime(1800, 8),
                  lastDate: DateTime(2101));
              if (picked != null && picked != selectedDate)
                setState(() {
                  selectedDate = picked;
                  dateToSend = "${selectedDate.toLocal()}".split(' ')[0];
                  widget.callBack(dateToSend, selectedDate.toString());
                });
            },
            child: Material(
              elevation: 1,
              borderRadius: BorderRadius.circular(5),
              shadowColor: AppColors.greyBorder,
              child: Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                  top: 5,
                ),
                height: 50,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: AppTitle(
                        title: dateToSend,
                        fontSize: AppFont.title2,
                      ),
                    ),
                    Padding(
                      child: Icon(Icons.calendar_today),
                      padding: EdgeInsets.only(right: 10),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey[300])),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
