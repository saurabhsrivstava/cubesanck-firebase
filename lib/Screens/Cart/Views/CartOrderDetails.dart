import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Screens/Cart/Bloc/index.dart';
import 'package:cubesnack/Screens/Cart/Models/MCartOrder.dart';
import 'package:cubesnack/Screens/Cart/Pages/CartPrentContainer.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartOrderDetails extends StatefulWidget {
  const CartOrderDetails({Key key}) : super(key: key);

  @override
  _CartOrderDetailsState createState() => _CartOrderDetailsState();
}

class _CartOrderDetailsState extends State<CartOrderDetails> {
  MCartOrder order = MCartOrder();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      builder: (context, state) {
        if (state is CartPriceDoneState) {
          order = state.order;
        }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      AppTitle(
                        title: "orderDetails",
                        fontSize: AppFont.title3,
                        fontWeight: AppFont.bold,
                        padding: EdgeInsets.only(top: 5, bottom: 5),
                      ),
                      Spacer(),
                      AppTitle(
                        title: "\$ ${order.orderDetails}",
                        fontSize: AppFont.title2,
                        fontWeight: AppFont.medium,
                        padding: EdgeInsets.only(top: 5, bottom: 5),
                      ),
                    ],
                  ),
                  Divider(),
                  Padding(
                    padding: EdgeInsets.only(top: 5, bottom: 5),
                    child: Row(
                      children: [
                        AppTitle(
                          title: "Cart Total",
                          fontSize: AppFont.title2,
                          fontWeight: AppFont.medium,
                        ),
                        Spacer(),
                        AppTitle(
                          title: "\$ ${order.total}",
                          fontSize: AppFont.title2,
                          fontWeight: AppFont.medium,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5, bottom: 5),
                    child: Row(
                      children: [
                        AppTitle(
                          title: "Savings",
                          fontSize: AppFont.title2,
                          fontWeight: AppFont.medium,
                        ),
                        Spacer(),
                        AppTitle(
                          title: "\$ ${order.savings}",
                          fontSize: AppFont.title2,
                          fontWeight: AppFont.medium,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5, bottom: 5),
                    child: Row(
                      children: [
                        AppTitle(
                          title: "Applicable Tax",
                          fontSize: AppFont.title2,
                          fontWeight: AppFont.medium,
                        ),
                        Spacer(),
                        AppTitle(
                          title: "\$ ${order.taxes}",
                          fontSize: AppFont.title2,
                          fontWeight: AppFont.medium,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5, bottom: 5),
                    child: Row(
                      children: [
                        AppTitle(
                          title: "Delivery",
                          fontSize: AppFont.title2,
                          fontWeight: AppFont.medium,
                        ),
                        Spacer(),
                        AppTitle(
                          title: "\$ ${order.extraDeliveryCharge}",
                          fontSize: AppFont.title2,
                          fontWeight: AppFont.medium,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      AppTitle(
                        padding: EdgeInsets.only(top: 5, bottom: 5),
                        title: "Order Total",
                        fontSize: AppFont.title2,
                        fontWeight: AppFont.medium,
                      ),
                      Spacer(),
                      AppTitle(
                        padding: EdgeInsets.only(top: 5, bottom: 5),
                        title: "\$ ${order.total}",
                        fontSize: AppFont.title2,
                        fontWeight: AppFont.medium,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
      cubit: CartPrentContainer.of(context).data.bloc,
    );
  }
}
