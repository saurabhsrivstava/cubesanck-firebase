import 'package:cubesnack/CommonViews/AppDropdown.dart';
import 'package:cubesnack/CommonViews/AppLoader.dart';
import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/CommonViews/AppUnderLineTitle.dart';
import 'package:cubesnack/CommonViews/AppWebView.dart';
import 'package:cubesnack/CommonViews/MultiTitle.dart';
import 'package:cubesnack/Constants/AppExtensions.dart';
import 'package:cubesnack/Constants/Constants.dart';
import 'package:cubesnack/Screens/Orders/Bloc/index.dart';
import 'package:cubesnack/Screens/Orders/CommonViews/OrderAddress.dart';
import 'package:cubesnack/Screens/Orders/Models/MOrderResponse.dart';
import 'package:cubesnack/Screens/Orders/SellerOrders/ManageOrder/Views/ManageOrderCell.dart';
import 'package:cubesnack/Screens/Products/Models/Products.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:cubesnack/Utils/UserSession.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast/toast.dart';

class SellerItemInfo extends StatefulWidget {
  final Products product;
  final MOrder order;
  const SellerItemInfo({Key key, this.product, this.order}) : super(key: key);

  @override
  _SellerItemInfoState createState() => _SellerItemInfoState();
}

class _SellerItemInfoState extends State<SellerItemInfo> {
  OrdersBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = OrdersBloc(OrdersDefaultState());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      builder: (context, state) {
        return Container(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  _ItemInfoTitle(),
                  Divider(),
                  Stack(
                    children: [
                      _ItemInfo(
                        product: widget.product,
                      ),
                      if (state is OrdersLoadingState)
                        AppLoader(
                          bgColor: Colors.transparent,
                          height: 40,
                        )
                    ],
                  ),
                  AppDropdown(
                    defaultValue: widget.product.deliveryStatus != null
                        ? ordersStatus[widget.product.deliveryStatus]
                        : "Recieve",
                    data: ordersStatus.values.map((e) => e).toList(),
                    title: "",
                    height: 25,
                    valueCallBack: (v, i) {
                      AppAlert.confirmationAlert(
                          context: context,
                          message:
                              "Are you sure? Do you want to update the product status",
                          callBack: (v) {
                            Navigator.pop(context);

                            if ("yes" == v) {
                              bloc.add(UpdateOrderStatusEvent(
                                  orderId: widget.order.orderId,
                                  productId: widget.product.id,
                                  status: i + 1));
                            } else {}
                          });
                    },
                  ),
                  Divider(),
                  Row(
                    children: [
                      Expanded(
                        child: MultiTitle(
                          top: 5,
                          title: AppTitle(
                            title: "Order Type: ",
                            fontWeight: FontWeight.w600,
                            fontSize: AppFont.title2,
                          ),
                          subTitle: AppTitle(
                            title: _getOrderType(),
                            fontSize: AppFont.title1,
                          ),
                        ),
                      ),
                      if (widget.product.labelUrl != null)
                        Expanded(
                            child: InkWell(
                                onTap: () {
                                  AppBrowser.load(widget.product.labelUrl);
                                },
                                child: Row(
                                  children: [
                                    AppTitle(
                                      title: "Generate shipping Label",
                                      padding: EdgeInsets.only(right: 10),
                                    ),
                                    Icon(
                                      Icons.print,
                                      color: Colors.blue,
                                    )
                                  ],
                                )))
                    ],
                  ),
                  Divider(),

                  Container(
                    margin: EdgeInsets.all(5),
                    child: Row(
                      children: [
                        Expanded(
                          child: OrderAddress(
                            title: "Shipping Address:",
                            line1: widget.product?.shippingAddress?.address1,
                            line2: widget.product.shippingAddress.address2 +
                                " " +
                                widget.product.shippingAddress?.city +
                                " " +
                                widget.product.shippingAddress?.state,
                            email: UserSession.shared.email,
                            phone: widget.product.shippingAddress.phone,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  //_PaidRow(),
                ],
              ),
            ),
          ),
        );
      },
      listener: (context, state) {
        if (state is OrderStatusUpdatedState) {
          Toast.show(state.message, context);
        }
      },
      cubit: bloc,
    );
  }

  _getOrderType() {
    if (widget.product.isStorePickup) {
      return "Store Pickup";
    } else if (widget.product.isHomeDelivery) {
      return "Home Delivery";
    } else {
      return "Fast Shipping";
    }
  }
}

class _ItemInfoTitle extends StatelessWidget {
  const _ItemInfoTitle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: AppTitle(
            title: "Item Info",
            fontWeight: AppFont.bold,
            fontSize: AppFont.title1,
            textAlign: TextAlign.start,
          ),
        ),
        Expanded(
          child: AppTitle(
            title: "Cost",
            fontWeight: AppFont.bold,
            fontSize: AppFont.title1,
          ),
        ),
        Expanded(
          child: AppTitle(
            title: "Qty",
            fontWeight: AppFont.bold,
            fontSize: AppFont.title1,
          ),
        ),
        Expanded(
          child: AppTitle(
            title: "Total",
            fontWeight: AppFont.bold,
            fontSize: AppFont.title1,
          ),
        )
      ],
    );
  }
}

class _ItemInfo extends StatelessWidget {
  final Products product;
  const _ItemInfo({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductImage(
                  url: product.image.image,
                ),
                AppUnderLineTitle(title: product.title),
              ],
            ),
          ),
          Expanded(child: AppTitle(title: "\$${product?.sellingPrice}")),
          Expanded(child: AppTitle(title: "${product.quantity}")),
          Expanded(
              child: AppTitle(
                  title: "\$ ${product.sellingPrice * product.quantity}"))
        ],
      ),
    );
  }
}

class _PaidRow extends StatelessWidget {
  const _PaidRow({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: AppTitle(
              title: "November 2020 cash on delivery",
              textAlign: TextAlign.left,
            ),
            flex: 2,
          ),
          Expanded(
              child: AppTitle(
            title: "\$10",
            textAlign: TextAlign.right,
          )),
          SizedBox(width: 20)
        ],
      ),
    );
  }
}
