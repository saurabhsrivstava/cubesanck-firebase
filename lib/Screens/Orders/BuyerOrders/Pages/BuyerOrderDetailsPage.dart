import 'package:cubesnack/CommonViews/AppLoader.dart';
import 'package:cubesnack/CommonViews/Navbar.dart';
import 'package:cubesnack/Screens/Orders/Bloc/index.dart';
import 'package:cubesnack/Screens/Orders/BuyerOrders/Views/BuyerOrderDetailsLIst.dart';
import 'package:cubesnack/Screens/Orders/Models/MOrderResponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuyerOrderDetailsPage extends StatefulWidget {
  final MOrder order;
  const BuyerOrderDetailsPage({Key key, this.order}) : super(key: key);

  @override
  _BuyerOrderDetailsPageState createState() => _BuyerOrderDetailsPageState();
}

class _BuyerOrderDetailsPageState extends State<BuyerOrderDetailsPage> {
  OrdersBloc bloc;
  MOrder order;
  @override
  void initState() {
    super.initState();
    bloc = OrdersBloc(OrdersDefaultState());
    bloc.add(LoadBuyerOrdersEvent(orderId: widget.order.orderId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Navbar(
          title: "orderDetails",
        ),
        body: BlocBuilder(
          builder: (context, state) {
            if (state is OrdersDoneState) {
              order = state.items.first;
            }
            if (state is OrdersLoadingState) {
              return AppLoader();
            }
            return BuyerOrderDetailsList(
              order: order,
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
