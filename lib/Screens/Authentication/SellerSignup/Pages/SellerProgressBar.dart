import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Constants/AppEnums.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';

import '../SellerSignupPage.dart';

class SellerProgressBar extends StatelessWidget {
  final List<SellerSignupProgressData> data;
  final int dividerCount;
  const SellerProgressBar({Key key, this.data, this.dividerCount = 5})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[..._getStatusDots()],
      ),
    );
  }

  _getStatusDots() {
    List<Widget> dots = List<Widget>();
    this.data.asMap().forEach((index, SellerSignupProgressData value) {
      final dot = value.status.getDot(value);
      dots.add(_getDot(index, dot));
    });
    return dots.toList();
  }

  _getDot(index, dot) {
    if (index == 0) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          dot,
        ],
      );
    } else {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _Devider(
            dividerCount: dividerCount,
          ),
          dot,
        ],
      );
    }
  }
}

class _CuurrentDot extends StatelessWidget {
  final String title;
  const _CuurrentDot({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.darkBlue, width: 2)),
          child: Center(
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.darkBlue),
            ),
          ),
        ),
        AppTitle(
          title: title,
          fontSize: AppFont.title0,
        )
      ],
    );
  }
}

class _CompletedDot extends StatelessWidget {
  final String title;

  const _CompletedDot({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.darkBlue),
            child: Icon(
              Icons.check,
              color: Colors.white,
            )),
        AppTitle(
          title: title,
          fontSize: AppFont.title0,
        )
      ],
    );
  }
}

class _NotvisitedDot extends StatelessWidget {
  final String title;

  const _NotvisitedDot({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.greyBorder, width: 2)),
        ),
        AppTitle(
          title: title,
          fontSize: AppFont.title0,
        )
      ],
    );
  }
}

class _Devider extends StatelessWidget {
  final int dividerCount;
  const _Devider({Key key, this.dividerCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: Center(
        child: Container(
          height: 3,
          width: (MediaQuery.of(context).size.width - 100) / dividerCount,
          color: AppColors.darkBlue,
        ),
      ),
    );
  }
}

extension SellerSignupProgressStatusExt on SellerSignupProgressStatus {
  getDot(SellerSignupProgressData data) {
    switch (this) {
      case SellerSignupProgressStatus.notVisited:
        return _NotvisitedDot(
          title: data.title,
        );
      case SellerSignupProgressStatus.filling:
        return _CuurrentDot(
          title: data.title,
        );
      case SellerSignupProgressStatus.filled:
        return _CompletedDot(
          title: data.title,
        );
    }
  }
}
