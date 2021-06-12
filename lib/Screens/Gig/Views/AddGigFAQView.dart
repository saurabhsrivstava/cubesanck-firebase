import 'package:cubesnack/CommonViews/AppTextView.dart';
import 'package:flutter/material.dart';

class AddGigFAQView extends StatelessWidget {
  const AddGigFAQView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        children: [
          AppTextView(
            title: "Briefly descrive your Gig",
          )
        ],
      ),
    );
  }
}
