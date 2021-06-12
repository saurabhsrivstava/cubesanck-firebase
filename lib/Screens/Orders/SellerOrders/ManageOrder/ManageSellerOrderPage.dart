import 'package:cubesnack/CommonViews/AppErrorView.dart';
import 'package:cubesnack/CommonViews/AppLoader.dart';
import 'package:cubesnack/CommonViews/Navbar.dart';
import 'package:cubesnack/Screens/Orders/Bloc/index.dart';
import 'package:cubesnack/Screens/Orders/Models/MOrderResponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Views/ManageSellerOrderBuilder.dart';

class ManageSellerOrderPage extends StatefulWidget {
  final bool isSellerPayouts;
  const ManageSellerOrderPage({Key key, this.isSellerPayouts = false})
      : super(key: key);

  @override
  _ManageSellerOrderPageState createState() => _ManageSellerOrderPageState();
}

class _ManageSellerOrderPageState extends State<ManageSellerOrderPage> {
  OrdersBloc bloc;
  List<MOrder> orders;
  @override
  void initState() {
    bloc = OrdersBloc(OrdersDefaultState());
    bloc.add(LoadSellerOrdersEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Navbar(
          title: "manageOrders",
        ),
        body: BlocProvider(
          create: (context) => bloc,
          child: BlocBuilder(
            builder: (context, state) {
              if (state is OrdersLoadingState) {
                return AppLoader();
              }
              if (state is OrdersDoneState) {
                orders = state.items;
              }
              if (state is ErrorOrdersState) {
                return AppErrorView(
                  callBack: () {
                    bloc.add(LoadSellerOrdersEvent());
                  },
                  error: state.errorMessage,
                );
              }
              return ManageSellerOrderBuilder(
                items: orders,
              );
            },
            cubit: bloc,
          ),
        ));
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
}
