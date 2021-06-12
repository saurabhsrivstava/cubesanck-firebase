import 'package:cubesnack/CommonViews/AppErrorView.dart';
import 'package:cubesnack/CommonViews/AppLoader.dart';
import 'package:cubesnack/CommonViews/Navbar.dart';
import 'package:cubesnack/Screens/Orders/Bloc/index.dart';
import 'package:cubesnack/Screens/Orders/BuyerOrders/Views/BuyerOrderListBuilder.dart';
import 'package:cubesnack/Screens/Orders/Models/MOrderResponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuyerOrderListPage extends StatefulWidget {
  const BuyerOrderListPage({Key key}) : super(key: key);

  @override
  _BuyerOrderListPageState createState() => _BuyerOrderListPageState();
}

class _BuyerOrderListPageState extends State<BuyerOrderListPage> {
  OrdersBloc bloc;
  List<MOrder> items;

  @override
  void initState() {
    bloc = OrdersBloc(OrdersDefaultState());
    bloc.add(LoadBuyerOrdersEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Navbar(
          title: "manageOrders",
        ),
        body: BlocBuilder(
          builder: (context, state) {
            if (state is OrdersLoadingState) {
              return AppLoader();
            }
            if (state is OrdersDoneState) {
              items = state.items;
            }
            if (state is ErrorOrdersState) {
              return AppErrorView(
                callBack: () => bloc.add(LoadBuyerOrdersEvent()),
                error: state.errorMessage,
              );
            }
            return BuyerOrderListBuilder(
              items: items,
            );
          },
          cubit: bloc,
        ));
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
}
