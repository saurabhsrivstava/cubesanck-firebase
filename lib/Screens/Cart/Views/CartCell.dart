import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Constants/AppExtensions.dart';

import 'package:cubesnack/Screens/Cart/Bloc/index.dart';
import 'package:cubesnack/Screens/Cart/Models/FastShippingResponse.dart';
import 'package:cubesnack/Screens/Cart/Models/MUserCartResponse.dart';
import 'package:cubesnack/Screens/Cart/Pages/CartPrentContainer.dart';
import 'package:cubesnack/Screens/Cart/Views/CartPreference.dart';
import 'package:cubesnack/Screens/Cart/Views/CartQuantiityCell.dart';
import 'package:cubesnack/Screens/Orders/SellerOrders/ManageOrder/Views/ManageOrderCell.dart';
import 'package:cubesnack/Screens/Products/Views/DeliveryOptions.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:cubesnack/Utils/Util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCell extends StatefulWidget {
  final int index;
  final MCartItem item;
  final List<FastShipping> deliveryOptions;
  const CartCell({Key key, this.index, this.item, this.deliveryOptions})
      : super(key: key);

  @override
  _CartCellState createState() => _CartCellState();
}

class _CartCellState extends State<CartCell> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ProductImage(
                        url: this.widget.item.product.image,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: AppTitle(
                              textAlign: TextAlign.left,
                              title: this.widget.item.product.title ?? "",
                              maxLines: 2,
                            ),
                          ),
                          AppTitle(
                            title: "\$${this.widget.item.product.price}",
                            fontWeight: AppFont.bold,
                            fontSize: AppFont.title5,
                            padding: EdgeInsets.only(top: 7, bottom: 7),
                          ),
                          CartQuanntityCell(
                            item: widget.item,
                          )
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Divider(
                      height: 0,
                    ),
                  ),
                  CartPreference(
                    callBack: (v, index) {
                      this.setState(() {
                        this.widget.item.delivery = v;
                      });
                      appPrint(index);
                    },
                    index: widget.index,
                    item: widget.item,
                    deliveryOptions: widget.deliveryOptions,
                  ),
                  //For Now remove this option
                  // AppCheckbox(
                  //   title: "Apply these selection to all item in the cart",
                  //   margin: EdgeInsets.only(top: 10),
                  //   valueCallBack: (v) {},
                  // ),
                  //_getDeliveryView()
                ],
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
                icon: Icon(Icons.delete_forever, color: Colors.red),
                onPressed: () => _showDeleteAlert(context, this.widget.item.id))
          ],
        ),
      ],
    );
  }

  _showDeleteAlert(context, id) {
    AppAlert.confirmationAlert(
        callBack: (v) {
          if (v == "yes") {
            Navigator.pop(context);
            BlocProvider.of<CartBloc>(context).add(DeleteCartEvent(
                id: id, items: CartPrentContainer.of(context).data.items));
          } else {
            Navigator.pop(context);
          }
        },
        context: context);
  }
}
