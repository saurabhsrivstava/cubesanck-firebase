import 'package:cubesnack/CommonViews/AppSquareCcheck.dart';
import 'package:cubesnack/CommonViews/AppTextField.dart';
import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:flutter/material.dart';

class GigFormate extends StatefulWidget {
  final Function valueCall;
  const GigFormate({Key key, @required this.valueCall}) : super(key: key);

  @override
  _GigFormateState createState() => _GigFormateState();
}

class _GigFormateState extends State<GigFormate> {
  Set<String> formates = Set<String>();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTitle(
          title: "Select the file foramts",
          textAlign: TextAlign.start,
        ),
        Wrap(
          children: [
            AppSquareCheck(title: "AI", valueCallback: (v) => _addValue(v)),
            AppSquareCheck(title: "JPG", valueCallback: (v) => _addValue(v)),
            AppSquareCheck(title: "PDF", valueCallback: (v) => _addValue(v)),
            AppSquareCheck(title: "PNG", valueCallback: (v) => _addValue(v)),
            AppSquareCheck(title: "PSD", valueCallback: (v) => _addValue(v)),
            AppSquareCheck(title: "ESP", valueCallback: (v) => _addValue(v)),
            AppSquareCheck(title: "CDR", valueCallback: (v) => _addValue(v)),
            AppSquareCheck(title: "SVG", valueCallback: (v) => _addValue(v)),
            AppSquareCheck(title: "Other", valueCallback: (v) => _addValue(v)),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        if (formates.contains("Other")) AppTextField(),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }

  _addValue(v) {
    if (formates.contains(v)) {
      formates.remove(v);
    } else {
      formates.add(v);
    }
    this.widget.valueCall(formates);
    this.setState(() {});
  }
}
