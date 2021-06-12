import 'package:cubesnack/CommonViews/AppDropdown.dart';
import 'package:cubesnack/CommonViews/AppLoader.dart';
import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/CommonViews/MultiTitle.dart';
import 'package:cubesnack/Screens/Orders/Bloc/index.dart';
import 'package:cubesnack/Screens/Orders/Models/MOrderResponse.dart';
import 'package:cubesnack/Screens/Orders/SellerOrders/ManageOrder/Views/ManageOrderCell.dart';
import 'package:cubesnack/Utils/AppDate.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SellerOrderInfo extends StatelessWidget {
  final MOrder order;
  const SellerOrderInfo({Key key, this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        margin: EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            OrderIDRow(
              order: this.order,
              isStatus: false,
            ),
            Divider(
              height: 0.5,
            ),
            Row(
              children: [
                _ProductDetails(
                  order: order,
                )
              ],
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}

class _ProductDetails extends StatefulWidget {
  final MOrder order;
  const _ProductDetails({Key key, this.order}) : super(key: key);

  @override
  __ProductDetailsState createState() => __ProductDetailsState();
}

class __ProductDetailsState extends State<_ProductDetails> {
  OrdersBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = OrdersBloc(OrdersDefaultState());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      builder: (context, state) {
        if (state is OrdersLoadingState) return AppLoader();
        return Container(
          width: MediaQuery.of(context).size.width * 0.7,
          child: Column(
            children: [
              MultiTitle(
                top: 5,
                title: AppTitle(
                  title: "Date Submitted: ",
                  fontWeight: FontWeight.w600,
                  fontSize: AppFont.title1,
                ),
                subTitle: AppTitle(
                  title: AppDate.dateFormate(widget.order.createdAt),
                  fontSize: AppFont.title0,
                ),
              ),
              MultiTitle(
                top: 5,
                title: AppTitle(
                  title: "Service Speed: ",
                  fontWeight: FontWeight.w600,
                  fontSize: AppFont.title1,
                ),
                subTitle: AppTitle(
                  title: "Standared",
                  fontSize: AppFont.title0,
                ),
              ),
              MultiTitle(
                top: 5,
                title: AppTitle(
                  title: "Payment by: ",
                  fontWeight: FontWeight.w600,
                  fontSize: AppFont.title1,
                ),
                subTitle: AppTitle(
                  title: widget.order.paymentType,
                  fontSize: AppFont.title0,
                ),
              ),
              MultiTitle(
                top: 5,
                title: AppTitle(
                  title: "Payout: ",
                  fontWeight: FontWeight.w600,
                  fontSize: AppFont.title1,
                ),
                subTitle: AppTitle(
                  title: "\$${widget.order.sellerCut}",
                  fontSize: AppFont.title0,
                ),
              ),
            ],
          ),
        );
      },
      cubit: bloc,
    );
  }
}
