import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';

import 'AddTagButton.dart';
import 'tagging.dart';

class TagSearchBar extends StatefulWidget {
  final Function suggestionsCallback;
  final Function valueCallback;
  final String title;
  final String displayTitle;

  const TagSearchBar(
      {Key key,
      this.suggestionsCallback,
      this.valueCallback,
      this.title = '',
      this.displayTitle = ""})
      : super(key: key);

  @override
  _TagSearchBarState createState() => _TagSearchBarState();
}

class _TagSearchBarState extends State<TagSearchBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterTagging(
        textFieldDecoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: this.widget.title,
            labelText: this.widget.displayTitle,
            suffixIcon: Icon(Icons.arrow_drop_down)),
        addButtonWidget: AddTagButton(),
        chipsColor: AppColors.darkBlue,
        chipsFontColor: Colors.white,
        deleteIcon: Icon(Icons.cancel, color: Colors.white),
        // chipsPadding: EdgeInsets.all(2.0),
        chipsFontSize: 14.0,
        chipsSpacing: 5.0,
        chipsFontFamily: AppFont.proximaNova,
        suggestionsCallback: (pattern) async {
          return await this.widget.suggestionsCallback(pattern);
          //return await TagSearchService.getSuggestions(pattern);
        },
        onChanged: (result) => this.widget.valueCallback(result));
  }
}

class TagSearchService {
  static Future<List> getSuggestions(String query) async {
    await Future.delayed(Duration(milliseconds: 400), null);
    List<dynamic> tagList = <dynamic>[];
    tagList.add({'name': "Flutter", 'value': 1});
    tagList.add({'name': "HummingBird", 'value': 2});
    tagList.add({'name': "Dart", 'value': 3});
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
