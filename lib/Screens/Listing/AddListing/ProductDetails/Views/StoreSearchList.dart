import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/CommonViews/MultiTitle.dart';
import 'package:cubesnack/Services/ApiResponse.dart';
import 'package:cubesnack/Services/AppAPI.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';

import 'TagSearchBar.dart';

class StoreSearchList extends StatelessWidget {
  final Function selectedStoreCallBack;
  const StoreSearchList({Key key, this.selectedStoreCallBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MultiTitle(
          title: AppTitle(
            title: "Select product store location",
            fontSize: AppFont.title2,
          ),
          subTitle: AppTitle(
            title: "(You can choose multiple store)*",
            fontSize: AppFont.title1,
          ),
          bottom: 5,
        ),
        TagSearchBar(
          title: "Stores",
          suggestionsCallback: this._getProduct,
          valueCallback: (v) {
            this.selectedStoreCallBack(
                v.toList().map((store) => store["value"].toString()));
          },
        ),
      ],
    );
  }

  _getProduct(query) async {
    final ApiResponse response = await AppApi().getStores();

    if (response.status == APIStatus.COMPLETED) {
      List<dynamic> tagList = <dynamic>[];
      final data = response.data.forEach((obj) =>
          tagList.add({'name': obj["display_name"], 'value': obj["id"]}));
      List<dynamic> filteredTagList = <dynamic>[];
      if (query.isNotEmpty) {
        filteredTagList.add({'name': query, 'value': 0});
      }
      for (var tag in tagList) {
        if (tag['name'].toLowerCase().contains(query)) {
          filteredTagList.add(tag);
        }
      }
      return filteredTagList;
    } else {}
  }
}
