import 'package:cubesnack/Constants/AppEnums.dart';
import 'package:flutter/material.dart';

import 'HomeAddressCell.dart';

class HomeDeliveryCell extends StatefulWidget {
  final Function callBack;
  final String productId;
  final bool isDeliveryOptions;
  final Function shippingCallBack;
  final CartDelivery type;
  const HomeDeliveryCell(
      {Key key,
      this.callBack,
      this.productId,
      this.isDeliveryOptions = false,
      this.shippingCallBack,
      this.type})
      : super(key: key);

  @override
  _HomeDeliveryCellState createState() => _HomeDeliveryCellState();
}

class _HomeDeliveryCellState extends State<HomeDeliveryCell> {
  bool isSameAddress = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeAddressCell(
          callBack: this.widget.callBack,
          productId: widget.productId,
          isDeliveryOptions: widget.isDeliveryOptions,
          shippingCallBack: this.widget.shippingCallBack,
          type: widget.type,
        ),
        // AppCheckbox(
        //   title: "Same as shipping Address",
        //   margin: EdgeInsets.only(top: 10),
        //   valueCallBack: (v) {
        //     this.setState(() {
        //       isSameAddress = v;
        //       _resetBillingAddress(v);
        //     });
        //   },
        //   value: isSameAddress,
        // ),
        SizedBox(height: 10),
        // if (isSameAddress == false)
        //   Column(
        //     children: [
        //       AppTextField(
        //         hintText: "Name",
        //         onChange: (v) {
        //           this.widget.userBillingAddress.name = v;
        //         },
        //       ),
        //       SellerAddress(
        //         address: this.widget.userBillingAddress.address,
        //       ),
        //     ],
        //   )
      ],
    );
  }

  // _resetBillingAddress(v) {
  //   if (v) {
  //     this.widget.userBillingAddress.address.reset();
  //   }
  // }
}
