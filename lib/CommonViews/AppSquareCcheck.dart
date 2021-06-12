import 'package:cubesnack/CommonViews/AppTitle.dart';

import 'package:flutter/material.dart';

class AppSquareCheck extends StatefulWidget {
  final String title;
  final Function valueCallback;
  AppSquareCheck({Key key, this.title, this.valueCallback}) : super(key: key);

  @override
  _AppSquareCheckState createState() => _AppSquareCheckState();
}

class _AppSquareCheckState extends State<AppSquareCheck> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      child: InkWell(
        onTap: () {
          this.setState(() {
            value = !value;
            this.widget.valueCallback(widget.title);
          });
        },
        child: Row(
          children: [
            Checkbox(
                value: value,
                onChanged: (v) {
                  this.setState(() {
                    value = v;
                                this.widget.valueCallback(widget.title);

                  });
                }),
            AppTitle(
              title: widget.title ?? "",
            )
          ],
        ),
      ),
    );
  }
}
