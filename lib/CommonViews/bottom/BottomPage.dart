import 'package:cubesnack/CommonViews/bottom/view/BottomView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomPage extends StatefulWidget {
  final double margin;

  const BottomPage({this.margin = 0, Key key}) : super(key: key);

  @override
  _BottomPageState createState() => _BottomPageState();
}

class _BottomPageState extends State<BottomPage> {
  @override
  Widget build(BuildContext context) {
    return BottomView(margin: this.widget.margin,);
  }
}
