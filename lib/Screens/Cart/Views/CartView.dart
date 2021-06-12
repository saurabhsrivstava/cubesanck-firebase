import 'package:cubesnack/CommonViews/AppRoundButton.dart';
import 'package:cubesnack/Constants/AppExtensions.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Pages/BusinessInfo/Models/BusinessInfo.dart';
import 'package:cubesnack/Screens/Cart/Bloc/Cart_state.dart';
import 'package:cubesnack/Screens/Cart/Bloc/index.dart';
import 'package:cubesnack/Screens/Cart/Models/FastShippingResponse.dart';
import 'package:cubesnack/Screens/Cart/Models/MCartOrder.dart';
import 'package:cubesnack/Screens/Cart/Models/MUserCartResponse.dart';
import 'package:cubesnack/Screens/Cart/Pages/CartPrentContainer.dart';
import 'package:cubesnack/Screens/Cart/Views/CartCell.dart';
import 'package:cubesnack/Screens/Cart/Views/CartPaymentMethod.dart';
import 'package:cubesnack/Screens/Cart/Views/HomeAddressCell.dart';
import 'package:cubesnack/Screens/Products/Views/DeliveryOptions.dart';
import 'package:cubesnack/Screens/Routes/AppRoutes.dart';
import 'package:cubesnack/Utils/Util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast/toast.dart';

import 'CartOrderDetails.dart';

class CartView extends StatefulWidget {
  final List<MCartItem> items;
  final String id;
  final List<FastShipping> deliveryOptions;
  const CartView({Key key, this.items, this.id, this.deliveryOptions})
      : super(key: key);

  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  String billingId;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          if (widget.items != null) ..._createCartList(context),
          CartOrderDetails(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: HomeAddressCell(
                  callBack: (v) {
                    appPrint(v.id);
                    billingId = v?.id;
                  },
                  title: "BillingAddress",
                ),
              ),
            ),
          ),
          // BillingAddressCell(
          //   billingAddress: billingAddress,
          // ),
          CartPaymentMethod(),
          BlocBuilder(
            cubit: CartPrentContainer.of(context).data.bloc,
            builder: (context, state) {
              MCartOrder order;
              if (state is CartPriceDoneState) {
                order = state.order;
                order.cartId = widget.id;
              }
              return AppRoundButton(
                title: "payNow",
                isRightIcon: false,
                onPressed: () {
                  appPrint(widget.items);
                  _createOrder(order, context);
                },
              );
            },
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  _createOrder(MCartOrder order, context) {
    final status = _validateOrder();
    if (status == false) {
      Toast.show("Please select the proper delivery option", context,
          gravity: 1, duration: 2);

      return;
    }

    final data = widget.items
        .map((e) => e.data.toJson(fastShipping: e.fastShipping))
        .toList();
    final invoiceData = {"items": data, "billing_address_id": billingId};
    // invoiceData["rate_info"] = {
    //   "items": widget.items.map((e) => e.fastShipping.toJson()).toList()
    // };

    Navigator.pushNamed(context, AppRoutes.cardList,
        arguments: {"order": order, "invoiceData": invoiceData});
  }

  _validateOrder() {
    bool status = true;
    widget.items.forEach((element) {
      if (element.data.isStorePickup &&
          (element.store.physicalStores.length < 1)) {
        status = false;
      }
      if ((element.data.isFastShipping) && element.fastShipping == null) {
        status = false;
      }
    });
    return status;
  }

  _createCartList(context) {
    return widget.items
        .asMap()
        .map((i, e) => MapEntry(
              i,
              CartCell(
                item: e,
                index: i,
                deliveryOptions: widget.deliveryOptions,
              ),
            ))
        .values
        .toList();
  }
}
