import 'package:cubesnack/CommonViews/AppRoundButton.dart';
import 'package:cubesnack/CommonViews/AppTextView.dart';
import 'package:cubesnack/Screens/Products/Models/MReview.dart';
import 'package:cubesnack/Screens/Reviews/Bloc/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'StarRowView.dart';

class WriteReviewView extends StatelessWidget {
  final MReview review;
  final Function callBack;
  const WriteReviewView({Key key, this.review, this.callBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        children: [
          StarRowView(
            valueCallBack: (v) {
              review.rating = v;
            },
          ),
          AppTextView(
            hintText: "Write your reviews here",
            title: "Reviews",
            onChange: (v) {
              review.message = v;
            },
          ),
          SizedBox(
            height: 50,
          ),
          AppRoundButton(
              title: "submit",
              isRightIcon: false,
              onPressed: () => this.callBack())
        ],
      ),
    );
  }
}
