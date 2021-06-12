import 'package:flutter/material.dart';

class StarRowView extends StatefulWidget {
  final Function valueCallBack;
  const StarRowView({Key key, @required this.valueCallBack}) : super(key: key);

  @override
  _StarRowViewState createState() => _StarRowViewState();
}

class _StarRowViewState extends State<StarRowView> {
  final stars = [
    Star(isFilled: false, index: 0),
    Star(isFilled: false, index: 1),
    Star(isFilled: false, index: 2),
    Star(isFilled: false, index: 3),
    Star(isFilled: false, index: 4)
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [..._createStars()],
    ));
  }

  _createStars() {
    return stars
        .map((e) => _Star(
            index: e.index,
            isFilled: e.isFilled,
            starCallBack: this._updateSelectedStars))
        .toList();
  }

  _updateSelectedStars(sIndex) {
    this.setState(() {
      stars.asMap().forEach((index, value) {
        if (sIndex >= index) {
          value.isFilled = true;
        } else {
          value.isFilled = false;
        }
      });
    });
    this.widget.valueCallBack(sIndex + 1);
  }
}

class Star {
  bool isFilled;
  int index;
  Star({this.index, this.isFilled});
}

class _Star extends StatelessWidget {
  final bool isFilled;
  final int index;
  final Function starCallBack;
  const _Star(
      {Key key, this.isFilled = false, this.index = 0, this.starCallBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: InkWell(
          onTap: () => this.starCallBack(index),
          child: Icon(
            Icons.star,
            size: 40,
            color: isFilled ? Colors.yellow : Colors.grey,
          )),
    );
  }
}
