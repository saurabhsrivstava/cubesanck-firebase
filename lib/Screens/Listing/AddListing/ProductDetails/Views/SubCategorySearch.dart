import 'package:cubesnack/Screens/Listing/AddListing/Models/MCategoryData.dart';
import 'package:flutter/material.dart';

import 'TagSearchBar.dart';

class SubCategorySearch extends StatelessWidget {
  final MCategoryData seledtedCat;
  final Function selectedCategoryCallBack;
  const SubCategorySearch(
      {Key key, this.selectedCategoryCallBack, this.seledtedCat})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TagSearchBar(
      title: "Sub Categories",
      suggestionsCallback: this._getProduct,
      valueCallback: (v) {
        this.selectedCategoryCallBack(
            v.toList().map((store) => store["value"].toString()));
      },
    );
  }

  _getProduct(query) async {
    List<dynamic> tagList = <dynamic>[];
    this.seledtedCat.options.forEach((element) {
      tagList.add({'name': element.name, 'value': element.id});
    });
    List<dynamic> filteredTagList = <dynamic>[];
    /*dont allow to create new
    if (query.isNotEmpty) {
      filteredTagList.add({'name': query, 'value': 0});
    }*/
    for (var tag in tagList) {
      if (tag['name'].toLowerCase().contains(query)) {
        filteredTagList.add(tag);
      }
    }
    return filteredTagList;
  }
}
