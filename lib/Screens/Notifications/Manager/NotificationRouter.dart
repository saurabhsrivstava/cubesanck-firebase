import 'dart:io';

import 'package:cubesnack/Screens/Orders/BuyerOrders/Pages/BuyerOrderDetailsPage.dart';
import 'package:cubesnack/Screens/Orders/Models/MOrderResponse.dart';
import 'package:cubesnack/Screens/Orders/SellerOrders/OrderDetails/SellerOrderDetailsPage.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationRouter {
  moveTo({context, RemoteMessage message}) {
    String screenName;
    String orderId;
    if (Platform.isIOS) {
      screenName = message.data["screen"];
      orderId = message.data["orderId"];
      if (screenName == "buyerOrder") {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BuyerOrderDetailsPage(
                  order: MOrder(orderId: orderId),
                )));
      }
      if (screenName == "sellerOrder") {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SellerOrderDetailsPage(
                  order: MOrder(orderId: orderId),
                )));
      }
    } else if (Platform.isAndroid) {
      screenName = message.data["screen"];
      orderId = message.data["orderId"];
      if (screenName == "buyerOrder") {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BuyerOrderDetailsPage(
                  order: MOrder(orderId: orderId),
                )));
      }
      if (screenName == "sellerOrder") {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SellerOrderDetailsPage(
                  order: MOrder(orderId: orderId),
                )));
      }
    } else {
      //WEb
    }
  }
}