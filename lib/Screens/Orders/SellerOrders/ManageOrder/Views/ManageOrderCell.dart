import 'package:cubesnack/CommonViews/AppRoundButton.dart';
import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Screens/Orders/Bloc/index.dart';
import 'package:cubesnack/Screens/Orders/Models/MOrderResponse.dart';
import 'package:cubesnack/Screens/Orders/SellerOrders/OrderDetails/SellerOrderDetailsPage.dart';
import 'package:cubesnack/Utils/AppDate.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ManageSellerOrderCell extends StatelessWidget {
  final MOrder order;
  final bool isSellerPayouts;
  const ManageSellerOrderCell({Key key, this.order, this.isSellerPayouts})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SellerOrderDetailsPage(
                      order: order,
                    ))).then((value) => {
              BlocProvider.of<OrdersBloc>(context).add(LoadSellerOrdersEvent())
            });
      },
      child: Card(
        child: Container(
          padding: EdgeInsets.all(5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ProductImage(
                url: order.items?.first?.image?.image,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OrderIDRow(
                      orderID: "order.",
                      order: order,
                    ),
                    AppTitle(
                      fontSize: AppFont.title1,
                      padding: EdgeInsets.only(top: 8, bottom: 8),
                      title: order?.items?.first?.title,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.start,
                    ),
                    _QuantityRow(
                      order: order,
                    )
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProductImage extends StatelessWidget {
  final String url;
  final bool isSelected;
  const ProductImage(
      {Key key,
      this.url =
          "https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
      this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        width: 60,
        margin: EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
            //borderRadius: BorderRadius.circular(5),
            border: isSelected ? Border.all(color: AppColors.darkBlue) : null),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.network(
            url,
            fit: BoxFit.cover,
          ),
        ));
  }
}

class OrderIDRow extends StatelessWidget {
  final String orderID;
  final bool isStatus;
  final MOrder order;
  const OrderIDRow({Key key, this.orderID, this.isStatus = true, this.order})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            AppTitle(
              title: "Order Id: ",
              fontWeight: FontWeight.w600,
              fontSize: AppFont.title2,
            ),
            AppTitle(
              title: this.order?.orderId?.split("-")?.first,
              fontSize: AppFont.title1,
            ),
          ],
        ),
        isStatus
            ? AppRoundButton(
                margin: 0,
                height: 15,
                title: order.status == null ? "Recieved" : order?.status,
                isRightIcon: false,
                fontSize: 10,
                width: 95,
                isLocalised: false,
                backgroundColor: AppColors.green,
              )
            : Container()
      ],
    );
  }
}

class _QuantityRow extends StatelessWidget {
  final MOrder order;
  const _QuantityRow({Key key, this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppTitle(
          title: "Quantity: ${order.items?.length}",
          fontSize: AppFont.title1,
        ),
        AppTitle(
          title: "Payout: ${order.sellerCut.toStringAsFixed(2)}",
          fontSize: AppFont.title1,
        ),
        AppTitle(
          title: AppDate.dateFormate(order?.createdAt),
          fontSize: AppFont.title1,
        ),
        // AppTitle(
        //   title: order.,
        //   fontSize: AppFont.title1,
        // ),
        // AppRoundButton(
        //   margin: 0,
        //   height: 15,
        //   title: "View Details",
        //   isRightIcon: false,
        //   fontSize: 10,
        //   width: 95,
        //   backgroundColor: Colors.white,
        //   borderColor: AppColors.greyBorder,
        //   isBorder: true,
        //   titleColor: AppColors.darkBlue,
        // )
      ],
    );
  }
}
