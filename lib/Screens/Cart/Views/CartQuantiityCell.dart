import 'package:cubesnack/CommonViews/AppLoader.dart';
import 'package:cubesnack/CommonViews/AppStepper.dart';
import 'package:cubesnack/Screens/Cart/Bloc/index.dart';
import 'package:cubesnack/Screens/Cart/Models/MUserCartResponse.dart';
import 'package:cubesnack/Screens/Cart/Pages/CartPrentContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartQuanntityCell extends StatefulWidget {
  final MCartItem item;
  CartQuanntityCell({Key key, this.item}) : super(key: key);

  @override
  _CartQuanntityCellState createState() => _CartQuanntityCellState();
}

class _CartQuanntityCellState extends State<CartQuanntityCell> {
  CartBloc bloc;

  @override
  void initState() {
    bloc = CartBloc(CartDefaultState());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      builder: (context, state) {
        if (state is CartDeleteDoneState) {
          CartPrentContainer.of(context).data.bloc.add(UpdateCartPriceEvent(
              items: CartPrentContainer.of(context).data.items));
        }

        return Container(
          child: Stack(
            alignment: Alignment.center,
            children: [
              AppStepper(
                valueCallBack: (v) {
                  widget.item.quantity = v;
                  bloc.add(UpdateQuantityCartEvent(
                      id: this.widget.item.id, quantity: v));
                },
                value: widget.item.quantity,
              ),
              if (state is CartLoadingState)
                AppLoader(
                  height: 40,
                  weidth: 25,
                  bgColor: Colors.transparent,
                )
            ],
          ),
        );
      },
      cubit: bloc,
    );
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
}
