import 'package:cubesnack/Screens/Notifications/Models/MNotificationResponse.dart';
import 'package:cubesnack/Screens/Notifications/Views/NotificationCell.dart';
import 'package:flutter/material.dart';

class NotificationListView extends StatelessWidget {
  final List<MNotificationData> data;
  const NotificationListView({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return NotificationCell(
            data: data[index],
          );
        },
        itemCount: data != null ? data.length : 0,
      ),
    );
  }
}
