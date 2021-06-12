import 'package:cubesnack/CommonViews/AppErrorView.dart';
import 'package:cubesnack/CommonViews/AppLoader.dart';
import 'package:cubesnack/CommonViews/Navbar.dart';
import 'package:cubesnack/Screens/Products/Models/Products.dart';
import 'package:cubesnack/Tabbar/WishList/Bloc/WishList_bloc.dart';
import 'package:cubesnack/Tabbar/WishList/Views/WishListBuilder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Bloc/index.dart';

class WishListPage extends StatefulWidget {
  const WishListPage({Key key}) : super(key: key);

  @override
  _WishListPageState createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
  WishListBloc bloc;

  @override
  void initState() {
    bloc = WishListBloc(WishListDefaultState());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(
        title: "wishList",
      ),
      body: Padding(
          padding: const EdgeInsets.only(bottom: 0),
          child: BlocBuilder(
            builder: (context, state) {
              List<Products> items;
              if (state is ErrorWishListState) {
                return AppErrorView(
                  error: state.errorMessage,
                  callBack: () {
                    bloc..add(LoadWishListEvent());
                  },
                );
              }
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
          )),
    );
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
}
