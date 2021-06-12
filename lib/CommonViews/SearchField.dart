import 'dart:async';

import 'package:cubesnack/Screens/Products/Models/Products.dart';
import 'package:cubesnack/Tabbar/Search/Search/index.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  final double outLineBorderRadius;

  const SearchField({
    Key key,
    this.outLineBorderRadius = 0,
  });

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchField> {
  SearchBloc bloc;
  List<Products> products;
  Timer _debounce;

  @override
  void initState() {
    super.initState();
    bloc = SearchBloc(UnSearchState());
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: TextField(
        autofocus: true,
        onChanged: (v) {
          if (_debounce?.isActive ?? false) _debounce.cancel();
          _debounce = Timer(const Duration(milliseconds: 500), () {
            // do something with query
            bloc.add(LoadSearchEvent(text: v));
          });
        },
        decoration: InputDecoration(
          hintText: "Search anything",
          fillColor: Colors.white,
          filled: true,
          border: InputBorder.none,
          suffixIcon: InkWell(
            onTap: () {},
            child: Icon(
              Icons.search,
              color: AppColors.lightGrey,
            ),
          ),
        ),
      ),
    );
  }
  _search(){

  }
}
