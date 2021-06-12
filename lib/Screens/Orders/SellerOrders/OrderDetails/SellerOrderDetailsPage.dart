import 'package:cubesnack/CommonViews/AppLoader.dart';
import 'package:cubesnack/CommonViews/Navbar.dart';
import 'package:cubesnack/Screens/Orders/Bloc/index.dart';
import 'package:cubesnack/Screens/Orders/Models/MOrderResponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Views/SellerOrderDetailBuilder.dart';

class SellerOrderDetailsPage extends StatefulWidget {
  final MOrder order;
  const SellerOrderDetailsPage({Key key, this.order}) : super(key: key);

  @override
  _SellerOrderDetailsPageState createState() => _SellerOrderDetailsPageState();
}

class _SellerOrderDetailsPageState extends State<SellerOrderDetailsPage> {
  OrdersBloc bloc;
  MOrder order;

  @override
  void initState() {
    super.initState();
    bloc = OrdersBloc(OrdersDefaultState());
    bloc.add(LoadSellerOrdersEvent(orderId: widget.order.orderId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Navbar(
          title: "orderDetails",
          isLocalised: true,
        ),
        body: BlocBuilder(
          builder: (context, state) {
            if (state is OrdersLoadingState) {
              return AppLoader();
            }
            if (state is OrdersDoneState) {
              order = state.items.first;
            }
            return SellerOrderDetailBuilder(
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
