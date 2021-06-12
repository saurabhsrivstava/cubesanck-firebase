import 'dart:async';

import 'package:cubesnack/CommonViews/AppLoader.dart';
import 'package:cubesnack/CommonViews/AppTextField.dart';
import 'package:cubesnack/CommonViews/Navbar.dart';
import 'package:cubesnack/Screens/Products/Models/Products.dart';
import 'package:cubesnack/Tabbar/Search/Search/index.dart';
import 'package:cubesnack/Tabbar/Search/SearchList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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
    return Scaffold(
      appBar: Navbar(
        title: "search",
      ),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppTextField(
                hintText: "Search",
                autofocus: true,
                onChange: (v) {
                  if (_debounce?.isActive ?? false) _debounce.cancel();
                  _debounce = Timer(const Duration(milliseconds: 500), () {
                    // do something with query
                    bloc.add(LoadSearchEvent(text: v));
                  });
                },
              ),
              BlocBuilder(
                builder: (context, state) {
                  if (state is SearchLoadingState)
                    return AppLoader(
                      bgColor: Colors.transparent,
                    );
                  if (state is SearchDoneState) {
                    products = state.products;
                  }
                  return Expanded(
                      child: SearchList(
                    products: products,
                  ));
                },
                cubit: bloc,
              )
            ],
          )),
    );
  }
}
