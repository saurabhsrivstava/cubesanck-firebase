import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Screens/Notifications/Models/MNotificationResponse.dart';
import 'package:cubesnack/Screens/Orders/BuyerOrders/Pages/BuyerOrderDetailsPage.dart';
import 'package:cubesnack/Screens/Orders/Models/MOrderResponse.dart';
import 'package:cubesnack/Screens/Orders/SellerOrders/OrderDetails/SellerOrderDetailsPage.dart';
import 'package:flutter/material.dart';

class NotificationCell extends StatelessWidget {
  final MNotificationData data;
  const NotificationCell({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (data.screenName == "buyerOrder") {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BuyerOrderDetailsPage(
                        order: MOrder(orderId: data.genericId),
                      )));
        }
        if (data.screenName == "sellerOrder") {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SellerOrderDetailsPage(
                        order: MOrder(orderId: data.genericId),
                      )));
        }
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.notifications),
              Container(
                width: MediaQuery.of(context).size.width * 0.85,
                child: AppTitle(
                  title: data.message.trim(),
                  maxLines: 4,
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
