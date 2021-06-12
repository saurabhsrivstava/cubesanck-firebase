import 'package:cubesnack/CommonViews/AppUnderLineButton.dart';
import 'package:cubesnack/Utils/Util.dart';
import 'package:flutter/material.dart';

class AppTimeButton extends StatefulWidget {
  final String defaultTime;
  final Function valueCallBack;
  const AppTimeButton({Key key, this.valueCallBack, this.defaultTime})
      : super(key: key);

  @override
  _AppTimeButtonState createState() => _AppTimeButtonState();
}

class _AppTimeButtonState extends State<AppTimeButton> {
  String defaultTime;

  @override
  void initState() {
    //defaultTime = DateFormat('hh:mm a').format(DateTime.now());
    defaultTime = this.widget.defaultTime;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AppUnderLineButton(
        height: 20,
        title: defaultTime,
        onPress: () => this.timePicker(context),
      ),
    );
  }

  timePicker(context) {
    showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
      initialTime: TimeOfDay.now(),
      context: context,
    ).then((value) {
      this.setState(() {
        defaultTime = value.format(context);
        this.widget.valueCallBack(defaultTime);
      });
      appPrint(defaultTime);
    });
  }
}
