import 'package:cubesnack/CommonViews/AppTimeButton.dart';
import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Constants/AppEnums.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Pages/BusinessInfo/Models/MStore.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';

class StoreTimings extends StatelessWidget {
  final MStore store;

  const StoreTimings({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTitle(
            title: "Select store hours",
            fontSize: AppFont.title2,
            fontWeight: AppFont.bold,
          ),
          ...store.buisnessHours
              .map((e) => _StoreTimeRow(
                    day: e,
                    store: store,
                  ))
              .toList()
        ],
      ),
    );
  }
}

class _StoreTimeRow extends StatefulWidget {
  final MBuisnessHours day;
  final MStore store;

  const _StoreTimeRow({Key key, this.day, this.store}) : super(key: key);

  @override
  __StoreTimeRowState createState() => __StoreTimeRowState();
}

class __StoreTimeRowState extends State<_StoreTimeRow> {
  bool status = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            child: AppTitle(
              title: this.widget.day.day,
              textAlign: TextAlign.left,
            ),
            width: 74,
          ),
          //Spacer(),
          Switch(
              value: this.widget.day.isOpen,
              onChanged: (v) {
                this.setState(() {
                  this.widget.day.isOpen = v;
                });
              }),
          AppTitle(title: this.widget.day.isOpen ? "Open" : "Close"),
          Spacer(),
          if (this.widget.day.isOpen)
            AppTimeButton(
              defaultTime: this.widget.day.startTime,
              valueCallBack: (v) {
                _insertData(type: StorTiming.start, time: v);
              },
            ),
          if (this.widget.day.isOpen)
            AppTimeButton(
              defaultTime: this.widget.day.endTime,
              valueCallBack: (v) {
                _insertData(type: StorTiming.end, time: v);
              },
            ),
        ],
      ),
    );
  }

  _insertData({StorTiming type, String time}) {
    final day = this.widget.day;
    if (type == StorTiming.start) {
      day.startTime = time;
    } else {
      day.endTime = time;
    }
  }
}

enum StorTiming { start, end }
