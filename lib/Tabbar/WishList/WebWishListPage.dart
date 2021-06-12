import 'package:cubesnack/CommonViews/AppLoader.dart';
import 'package:cubesnack/CommonViews/WebNavigationBar.dart';
import 'package:cubesnack/Screens/Products/Models/Products.dart';import 'package:cubesnack/Tabbar/Home/Models/MHomeProductList.dart';
import 'package:cubesnack/Tabbar/WishList/Bloc/WishList_bloc.dart';
import 'package:cubesnack/Tabbar/WishList/Views/WishListBuilder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Bloc/index.dart';

class WebWishListPage extends StatefulWidget {
  const WebWishListPage({Key key}) : super(key: key);

  @override
  _WebWishListPageState createState() => _WebWishListPageState();
}

class _WebWishListPageState extends State<WebWishListPage> {
  WishListBloc bloc;

  @override
  void initState() {
    bloc = WishListBloc(WishListDefaultState());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 10,
      child: Scaffold(
        appBar: WebNavigationBar(),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 0),
          child: BlocBuilder(
            builder: (context, state) {
              List<Products> items;
              if (state is WishListLoadingState) {
                return AppLoader();
              }
              if (state is WishListDoneState) {
                items = state.items;
              }
              return WishListBuilder(
                items: items,
              );
            },
            cubit: bloc..add(LoadWishListEvent()),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
}
