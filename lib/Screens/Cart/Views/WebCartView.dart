import 'package:cubesnack/CommonViews/AppRoundButton.dart';
import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/CommonViews/bottom/BottomPage.dart';
import 'package:cubesnack/Screens/Cart/Bloc/Cart_state.dart';
import 'package:cubesnack/Screens/Cart/Models/FastShippingResponse.dart';
import 'package:cubesnack/Screens/Cart/Models/MCartOrder.dart';
import 'package:cubesnack/Screens/Cart/Models/MUserCartResponse.dart';
import 'package:cubesnack/Screens/Cart/Pages/CartPrentContainer.dart';
import 'package:cubesnack/Screens/Cart/Views/CartCoupon.dart';
import 'package:cubesnack/Screens/Cart/Views/CartOrderDetails.dart';
import 'package:cubesnack/Screens/Cart/Views/CartPaymentMethod.dart';
import 'package:cubesnack/Screens/Cart/Views/WebCartCell.dart';
import 'package:cubesnack/Screens/Routes/AppRoutes.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:cubesnack/Utils/Util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast/toast.dart';

class WebCartView extends StatefulWidget {
  final List<MCartItem> items;
  final String id;
  final List<FastShipping> deliveryOptions;

  const WebCartView({Key key, this.items, this.id, this.deliveryOptions})
      : super(key: key);

  @override
  _WebCartViewState createState() => _WebCartViewState();
}

class _WebCartViewState extends State<WebCartView> {
  String billingId;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20),
            width: double.infinity,
            decoration: BoxDecoration(color: AppColors.product_category),
            child: AppTitle(
              title: "Your Cart",
              color: Colors.black,
              fontWeight: AppFont.regular,
              fontSize: AppFont.header,
              padding: EdgeInsets.only(top: 40, bottom: 40),
            ),
          ),
          Container(
            padding:
                EdgeInsets.only(left: size.height / 5, right: size.height / 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 70,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (widget.items != null) ..._createCartList(context),
                    ],
                  ),
                ),
                Expanded(
                  flex: 30,
                  child: Column(
                    children: [
                      CartCoupon(),
                      CartOrderDetails(),
                      // Padding(
                      //   padding: const EdgeInsets.all(10.0),
                      //   child: Card(
                      //     child: Padding(
                      //       padding: const EdgeInsets.all(10.0),
                      //       child: HomeAddressCell(
                      //         callBack: (v) {
                      //           appPrint(v.id);
                      //           billingId = v?.id;
                      //         },
                      //         title: "BillingAddress",
                      //       ),
                      //     ),
                      //   ),
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
                )
              ],
            ),
          ),
          BottomPage(margin: 80,)
        ],
      ),
    );
  }

  _createOrder(MCartOrder order, context) {
    final status = _validateOrder();
    if (status == false) {
      Toast.show("Please select the proper delivery option", context,
          gravity: 1);

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
      if ((element.data.isHomeDelivery || element.data.isFastShipping) &&
          element.fastShipping == null) {
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
              WebCartCell(
                item: e,
                index: i,
                deliveryOptions: widget.deliveryOptions,
              ),
            ))
        .values
        .toList();
  }
}
