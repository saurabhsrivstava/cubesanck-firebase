import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';

class AppStepper extends StatefulWidget {
  final Function valueCallBack;
  final int value;
  const AppStepper({Key key, this.valueCallBack, this.value = 0})
      : super(key: key);

  @override
  _AppStepperState createState() => _AppStepperState();
}

class _AppStepperState extends State<AppStepper> {
  int count = 0;

  @override
  void initState() {
    count = this.widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          InkWell(
            child: Container(
              child: Icon(Icons.remove),
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.greyBorder),
                  borderRadius: BorderRadius.circular(3)),
            ),
            onTap: () {
              this.setState(() {
                if (count == 0) return;
                count -= 1;
                this.widget.valueCallBack(count);
              });
            },
          ),
          Container(
            child: AppTitle(title: "$count"),
            width: 30,
          ),
          InkWell(
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.greyBorder),
                  borderRadius: BorderRadius.circular(3)),
              child: Icon(Icons.add),
              height: 25,
              width: 25,
            ),
            onTap: () {
              this.setState(() {
                count += 1;
                this.widget.valueCallBack(count);
              });
            },
          ),
        ],
      ),
    );
  }
}
