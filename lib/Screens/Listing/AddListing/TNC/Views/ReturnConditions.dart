import 'package:cubesnack/CommonViews/AppTextField.dart';
import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';

class ReturnConditions extends StatefulWidget {
  final List<String> points;
  final String title;
  ReturnConditions({Key key, this.points, this.title}) : super(key: key);

  @override
  _ReturnConditionsState createState() => _ReturnConditionsState();
}

class _ReturnConditionsState extends State<ReturnConditions> {
  //int index = -1;
  @override
  void initState() {
    this.widget.points.add("");
    //index = index + 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTitle(
            title: widget.title ??
                "Briefely list your conditions for acceppting returns",
            padding: EdgeInsets.only(top: 30),
            fontSize: AppFont.title3,
          ),
          ...this
              .widget
              .points
              .asMap()
              .entries
              .map((map) => _TextfiledRow(
                    index: map.key,
                    valueCallBack: (v, index) {
                      this.widget.points[index] = v;
                    },
                    callBack: (index) {
                      if (this.widget.points.length == 1) {
                        return;
                      }
                      this.setState(() {
                        this.widget.points.removeAt(index);
                      });
                    },
                  ))
              .toList(),
          IconButton(
              icon: Icon(Icons.add_circle),
              onPressed: () {
                if (this.widget.points.length > 4) {
                  return;
                }
                this.setState(() {
                  this.widget.points.add("");
                });
              })
        ],
      ),
    );
  }
}

class _TextfiledRow extends StatelessWidget {
  final Function callBack;
  final Function valueCallBack;
  final int index;

  const _TextfiledRow({Key key, this.callBack, this.valueCallBack, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: AppTextField(
            onChange: (v) => this.valueCallBack(v, index),
          )),
          Container(
            child: InkWell(
              child: Icon(Icons.close),
              onTap: () => this.callBack(index),
            ),
          )
        ],
      ),
    );
  }
}
