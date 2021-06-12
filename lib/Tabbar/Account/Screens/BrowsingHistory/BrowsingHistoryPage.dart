import 'package:cubesnack/CommonViews/AppErrorView.dart';
import 'package:cubesnack/CommonViews/AppLoader.dart';
import 'package:cubesnack/CommonViews/Navbar.dart';
import 'package:cubesnack/Screens/Products/Models/Products.dart';
import 'package:cubesnack/Tabbar/Account/Bloc/index.dart';
import 'package:cubesnack/Tabbar/Account/Screens/BrowsingHistory/Views/BrowsingHistoryBuilder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BrowsingHistoryPage extends StatefulWidget {
  const BrowsingHistoryPage({Key key}) : super(key: key);

  @override
  _BrowsingHistoryPageState createState() => _BrowsingHistoryPageState();
}

class _BrowsingHistoryPageState extends State<BrowsingHistoryPage> {
  AccountBloc bloc;
  List<Products> products;

  @override
  void initState() {
    bloc = AccountBloc(AccountDefaultState());
    bloc.add(LoadHistoryEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Navbar(
          title: "history",
        ),
        body: BlocBuilder(
          builder: (context, state) {
            if (state is ErrorAccountState) {
              return AppErrorView(
                error: state.errorMessage,
                callBack: () {
                  bloc.add(LoadHistoryEvent());
                },
              );
            }
            if (state is HistoryDoneState) {
              products = state.products;
            }
            if (state is AccountLoadingState) return AppLoader();
            return BrowsingHistoryBuilder(
              products: products,
            );
          },
          cubit: bloc,
        ));
  }
}
