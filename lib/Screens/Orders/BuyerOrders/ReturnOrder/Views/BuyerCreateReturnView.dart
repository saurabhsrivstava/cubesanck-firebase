import 'package:cubesnack/CommonViews/AppDropdown.dart';
import 'package:cubesnack/CommonViews/AppRoundButton.dart';
import 'package:cubesnack/CommonViews/AppTextView.dart';
import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Screens/Orders/Bloc/index.dart';
import 'package:cubesnack/Screens/Orders/Models/MOrderResponse.dart';
import 'package:cubesnack/Screens/Orders/SellerOrders/ManageOrder/Views/ManageOrderCell.dart';
import 'package:cubesnack/Screens/Products/Models/Products.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:cubesnack/Utils/Util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuyerCreateReturnView extends StatefulWidget {
  final Products product;
  final MOrder order;
  const BuyerCreateReturnView({
    Key key,
    this.product,
    this.order,
  }) : super(key: key);

  @override
  _BuyerCreateReturnViewState createState() => _BuyerCreateReturnViewState();
}

class _BuyerCreateReturnViewState extends State<BuyerCreateReturnView> {
  String reason = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductImage(
                    url: widget.product.image.image,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AppTitle(title: widget.product.title),
                      Divider(),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          AppTitle(
                            title: "\$${widget.product.sellingPrice}",
                            fontWeight: AppFont.bold,
                            fontSize: 20,
                          ),
                          Container()
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  AppDropdown(
                    data: [
                      "Size/Color issue",
                      "Did not like product",
                      "Defactive damage product received",
                      "Wrong item shipped",
                      "Other"
                    ],
                    title: "Choose return Reason",
                    valueCallBack: (v, i) {
                      appPrint(v);
                      this.reason = v;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AppTextView(
                    title: "Additional Comment",
                  )
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTitle(title: "Verify Return Request"),
                  Divider(),
                  Row(
                    children: [
                      Icon(Icons.repeat_rounded),
                      AppTitle(
                          title:
                              "Return will be credited to the account used by payment"),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      AppCheckbox(),
                      Flexible(
                        child: AppTitle(
                            padding: EdgeInsets.all(10),
                            textAlign: TextAlign.left,
                            maxLines: 5,
                            title:
                                "I agree terms with MRP tag attached and in their original condition"),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  AppRoundButton(
                    title: "submit",
                    isRightIcon: false,
                    margin: 10,
                    onPressed: () {
                      BlocProvider.of<OrdersBloc>(context).add(
                          CreateReturnRequestEvent(
                              order: widget.order,
                              product: widget.product,
                              reason: reason));
                    },
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class AppCheckbox extends StatefulWidget {
  const AppCheckbox({Key key}) : super(key: key);

  @override
  _AppCheckboxState createState() => _AppCheckboxState();
}

class _AppCheckboxState extends State<AppCheckbox> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        this.setState(() {
          value = !value;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: AppColors.darkBlue,
        ),
        child: Icon(value ? Icons.check_box : Icons.check,
            color: value ? AppColors.darkBlue : Colors.white),
      ),
    );
  }
}
