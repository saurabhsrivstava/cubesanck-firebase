import 'package:cubesnack/CommonViews/bottom/view/AppStoreView.dart';
import 'package:cubesnack/CommonViews/bottom/view/CompanyView.dart';
import 'package:cubesnack/CommonViews/bottom/view/LetUsHelpView.dart';
import 'package:cubesnack/CommonViews/bottom/view/PoliciesView.dart';
import 'package:flutter/cupertino.dart';

class TopLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: AppStoreView(),
          ),
          Expanded(
            child: CompanyView(),
          ),
          Expanded(
            child: LetUsHelpView(),
          ),
          Expanded(
            child: PoliciesView(),
          )
        ],
      ),
    );
  }
}
