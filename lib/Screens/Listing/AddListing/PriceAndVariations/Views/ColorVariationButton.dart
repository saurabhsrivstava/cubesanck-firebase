import 'package:cubesnack/Screens/Listing/AddListing/ProductDetails/Views/TagSearchBar.dart';
import 'package:cubesnack/Services/AppAPI.dart';
import 'package:cubesnack/Utils/Util.dart';
import 'package:flutter/material.dart';

class ColorVariationSearchList extends StatelessWidget {
  final List<dynamic> variants;
  final Function selectedVariationCallBack;
  const ColorVariationSearchList(
      {Key key, this.selectedVariationCallBack, this.variants})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TagSearchBar(
          title: "Variations",
          displayTitle: "Variations",
          suggestionsCallback: this._getProduct,
          valueCallback: (List<dynamic> v) {
            List<dynamic> allOptions = List<dynamic>();
            for (var obj in v) {
              final option = variants
                  .firstWhere((element) => element.type.id == obj["value"]);
              allOptions.add(option);
            }
            appPrint(allOptions);
            this.selectedVariationCallBack(allOptions);
            // this.selectedVariationCallBack(
            //     v.toList().map((store) => store["value"].toString()));
          },
        ),
      ],
    );
  }

  _getProduct(query) async {
    List<dynamic> tagList = <dynamic>[];
    this.variants.forEach((e) => tagList.add({
          'name': e.type.name,
          'value': e.type.id,
        }));
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
  }
}

class VariationOptionSearchList extends StatelessWidget {
  final List<dynamic> variants;
  final String displayTitle;
  final Function selectedVariationCallBack;
  final String index;
  const VariationOptionSearchList(
      {Key key,
      this.selectedVariationCallBack,
      this.variants,
      this.displayTitle,
      this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          TagSearchBar(
            title: displayTitle,
            displayTitle: displayTitle,
            suggestionsCallback: this._getProduct,
            valueCallback: (List<dynamic> v) {
              List<dynamic> modified = List<dynamic>();
              //final customTag = v.firstWhere((element) => element["value"] == 0);
              //Add custom tag get id and
              for (var obj in v) {
                modified.add({
                  "name": obj["name"],
                  "value": obj["value"],
                  "type": index
                });
              }
              this.selectedVariationCallBack(modified, index);
            },
          ),
        ],
      ),
    );
  }

  _getProduct(query) async {
    List<dynamic> tagList = <dynamic>[];
    this.variants.forEach((e) => tagList.add({
          'name': e.name,
          'value': e.id,
        }));
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
  }

  // _createCustomTag(){
  //   AppApi().
  // }
}
