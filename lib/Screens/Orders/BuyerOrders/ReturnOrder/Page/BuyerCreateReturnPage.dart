import 'package:cubesnack/CommonViews/AppLoader.dart';
import 'package:cubesnack/CommonViews/Navbar.dart';
import 'package:cubesnack/Screens/Orders/Bloc/index.dart';
import 'package:cubesnack/Screens/Orders/BuyerOrders/ReturnOrder/Views/BuyerCreateReturnView.dart';
import 'package:cubesnack/Screens/Orders/Models/MOrderResponse.dart';
import 'package:cubesnack/Screens/Products/Models/Products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast/toast.dart';

class BuyerCreateReturnPage extends StatefulWidget {
  final Products product;
  final MOrder order;

  const BuyerCreateReturnPage({Key key, this.product, this.order})
      : super(key: key);

  @override
  _BuyerCreateReturnPageState createState() => _BuyerCreateReturnPageState();
}

class _BuyerCreateReturnPageState extends State<BuyerCreateReturnPage> {
  OrdersBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = OrdersBloc(OrdersDefaultState());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
          create: (context) => bloc,
          child: BlocConsumer(
            builder: (context, state) {
              return Stack(
                children: [
                  BuyerCreateReturnView(
                    product: widget.product,
                    order: widget.order,
                  ),
                  if (state is OrdersLoadingState) AppLoader()
                ],
              );
            },
            listener: (context, state) {
              if (state is OrderStatusUpdatedState) {
                Toast.show(state.message, context);
                Navigator.pop(context);
              }
            },
            cubit: bloc,
          )),
      appBar: Navbar(
        title: "returnRequest",
      ),
    );
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
}
