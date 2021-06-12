import 'package:cubesnack/CommonViews/AppGroupCheckbox.dart';
import 'package:cubesnack/Constants/AppEnums.dart';
import 'package:cubesnack/Screens/Cart/Bloc/Cart_event.dart';
import 'package:cubesnack/Screens/Cart/Models/FastShippingResponse.dart';
import 'package:cubesnack/Screens/Cart/Models/MUserCartResponse.dart';
import 'package:cubesnack/Screens/Cart/Pages/CartPrentContainer.dart';
import 'package:cubesnack/Screens/Cart/Views/FastShippingCell.dart';
import 'package:cubesnack/Screens/Products/Views/DeliveryOptions.dart';
import 'package:flutter/material.dart';

import 'HomeDeliveryCell.dart';
import 'StoreAddressCell.dart';

class CartPreference extends StatefulWidget {
  final Function callBack;
  final int index;
  final MCartItem item;
  final double margin;
  final List<FastShipping> deliveryOptions;

  const CartPreference(
      {Key key, this.callBack, this.index, this.item, this.deliveryOptions,this.margin=0})
      : super(key: key);

  @override
  _CartPreferenceState createState() => _CartPreferenceState();
}

class _CartPreferenceState extends State<CartPreference> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: this.widget.margin),
          child: Row(
            children: [
              AppGroupCheckbox(
                data: ["Store pickup", "Home Delivery", "Fast Shipping"],
                title: "Choose your preferennce for this item",
                valueCallBack: (v, i) => {
                  this.setState(() {
                    widget.item.delivery = _getType(v);
                  })
                },
                value: "Store pickup",
              )
            ],
          ),
        ),
        Divider(),
        _getDeliveryView(context)
      ],
    );
  }

  _getType(v) {
    if ("Store pickup" == v) {
      return CartDelivery.store;
    } else if ("Home Delivery" == v) {
      return CartDelivery.home;
    } else {
      return CartDelivery.fastShipping;
    }
  }

  _getDeliveryView(context) {
    if (this.widget.item.delivery == CartDelivery.store) {
      this.widget.item.data.updateDeliveryOption(
          store: true, storeId: widget.item.store.storeId);
      this.widget.item.fastShipping = null;
      CartPrentContainer.of(context).data.bloc
        ..add(UpdateCartPriceEvent(
            items: CartPrentContainer.of(context).data.items));
      return StoreAddressCell(
        store: this.widget.item.store,
        // valueCallBack: (MPhysicalStore s) {
        //   this
        //       .widget
        //       .item
        //       .data
        //       .updateDeliveryOption(store: true, storeId: s.address.id);
        // },
      );
    } else if (this.widget.item.delivery == CartDelivery.home) {
      //final productId = widget.item.product.productId;
      // return Column(
      //   children: [
      //     HomeDeliveryCell(
      //       productId: productId,
      //       isDeliveryOptions: true,
      //       type: CartDelivery.home,
      //       shippingCallBack: (v) {
      //         this.widget.item.fastShipping = v;
      //         CartPrentContainer.of(context).data.bloc
      //           ..add(UpdateCartPriceEvent(
      //               items: CartPrentContainer.of(context).data.items));
      //       },
      //       callBack: (v) {
      //         this
      //             .widget
      //             .item
      //             .data
      //             .updateDeliveryOption(home: true, shippingAddressId: v.id);
      //         CartPrentContainer.of(context).data.bloc
      //           ..add(UpdateCartPriceEvent(
      //               items: CartPrentContainer.of(context).data.items));
      //       },
      //     ),
      //   ],
      // );
      return HomeDeliveryCell(
        isDeliveryOptions: false,
        callBack: (v) {
          this.widget.item.fastShipping = null;
          this
              .widget
              .item
              .data
              .updateDeliveryOption(home: true, shippingAddressId: v.id);
          CartPrentContainer.of(context).data.bloc
            ..add(UpdateCartPriceEvent(
                items: CartPrentContainer.of(context).data.items));
        },
      );
    } else {
      final productId = widget.item.product.productId;
      return Column(
        children: [
          HomeDeliveryCell(
            productId: productId,
            isDeliveryOptions: true,
            type: CartDelivery.fastShipping,
            shippingCallBack: (v) {
              this.widget.item.fastShipping = v;
              //this.widget.deliveryOptions.add(v);
              CartPrentContainer.of(context).data.bloc
                ..add(UpdateCartPriceEvent(
                    items: CartPrentContainer.of(context).data.items));
            },
            callBack: (v) {
              this
                  .widget
                  .item
                  .data
                  .updateDeliveryOption(fast: true, shippingAddressId: v.id);
              CartPrentContainer.of(context).data.bloc
                ..add(UpdateCartPriceEvent(
                    items: CartPrentContainer.of(context).data.items));
            },
          ),
        ],
      );
    }
  }
}
