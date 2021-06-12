import 'package:cubesnack/Screens/Notifications/Manager/NotificationRouter.dart';
import 'package:cubesnack/Screens/Notifications/Services/NotificationServices.dart';
import 'package:cubesnack/Utils/Util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationManager {
  static final NotificationManager shared = new NotificationManager._internal();
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  factory NotificationManager() {
    return shared;
  }
  NotificationManager._internal();

  registerForFCM(BuildContext context) async {
    _messaging.requestPermission();
    _messaging.getToken().then((String token) {
      appPrint(token);
      final service = NotificationServices();
      service.registerToken(token);
      final s = NotificationServices();
      s.registerToken(token);
      // NotificationServices.post(
      //     body: {'device_id': '$token', 'device_type': '$deviceType'});
      //Register Token to Server
    });

    String token = await _messaging.getToken(
      vapidKey: "BAiFw8F1c_mmMQQWoQOR0pTWHloCPJLZKJdzNvG7kQObtLLEeUZfdZ12NE39-uDiMcQFFruaOoykdPW70LZr22o",
    );
    appPrint(token);
    // FirebaseMessaging.onBackgroundMessage((RemoteMessage message) {
    //   print(message);
    //   //return moveToScreen(message, context);
    //   return;
    // });
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print(message);
      //return moveToScreen(message, context);
      return;
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      NotificationRouter router = NotificationRouter();
      print(message);
      return router.moveTo(
          context: context, message: message); //moveToScreen(message, context);
    });
    _messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) async {

  }


  moveToScreen(message, context) async {
    //   String screenName;
    //   String feedID;
    //   int notificationId;
    //   if (Platform.isIOS) {
    //     screenName = message["screen"];
    //     feedID = message["id"];
    //     notificationId = message["notification_id"];
    //   } else {
    //     screenName = message["data"]["screen"];
    //     feedID = message["data"]["id"];
    //     notificationId = message["notification_id"];
    //   }
    //   if (screenName == "article") {
    //     Navigator.of(context).push(MaterialPageRoute(
    //         builder: (context) => FeedsPage(
    //               needHeader: false,
    //               needBack: true,
    //             )));
    //   } else if (screenName == "article_detail") {
    //     final token = await UserSession.getToken();
    //     NotificationService.readNotification(notificationId);
    //     final result = Navigator.of(context).pushNamed(
    //       '/feed/details',
    //       arguments: FeedDetailsArguments(
    //         id: int.parse(feedID),
    //         isNotification: true,
    //         token: token.replaceAll(new RegExp(r'Token '), ''),
    //       ),
    //     );
    //   } else if (screenName == 'comment_details') {
    //     final token = await UserSession.getToken();
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //           builder: (context) => CommentDetails(
    //                 id: int.parse(feedID),
    //                 token: token.replaceAll(new RegExp(r'Token '), ''),
    //                 notiFicationId: notificationId,
    //               )),
    //     );
    //   } else if (screenName == 'social_details') {
    //     //TokenManager.singleton.setCurrentTab(3);
    //     final token = await UserSession.getToken();
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //           builder: (context) => CommentDetails(
    //                 id: int.parse(feedID),
    //                 token: token.replaceAll(new RegExp(r'Token '), ''),
    //               )),
    //     ).then((onValue) {
    //       // TokenManager.singleton.setCurrentTab(3);
    //     });
    //   }
    // }
  }
}