import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';

class RattingRow extends StatelessWidget {
  final double rattig;
  final bool isCount;
  final double starSize;
  const RattingRow(
      {Key key, this.rattig = 0.0, this.isCount = true, this.starSize = 15.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ..._createStars(),
          if (isCount)
            AppTitle(
              title: "$rattig",
              fontWeight: AppFont.bold,
            )
        ],
      ),
    );
  }

  _createStars() {
    List<Widget> widgets = List<Widget>();
    for (int i = 1; i < 6; i++) {
      widgets.add(_Star(
        isFilled: rattig >= i ? true : false,
        starSize: starSize,
      ));
    }
    return widgets.toList();
  }
}

class _Star extends StatelessWidget {
  final double starSize;

  final bool isFilled;
  const _Star({Key key, this.isFilled = false, this.starSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isFilled
        ? Icon(
            Icons.star,
            color: Colors.yellow,
            size: starSize,
          )
        : Icon(
            Icons.star_border,
            color: AppColors.greyBorder,
            size: starSize,
          );
  }
}
