import 'package:cubesnack/CommonViews/AppTitle.dart';
import 'package:cubesnack/Utils/AppTheme.dart';
import 'package:cubesnack/Utils/Util.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppAlert {
  static showAlert(
      {String title = '',
      String message = '',
      BuildContext context,
      isLocalised = false}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: AppTitle(
              title: title,
              fontSize: AppFont.header,
              fontWeight: AppFont.bold,
              isLocalised: isLocalised,
            ),
            content: AppTitle(
              title: message,
              fontSize: AppFont.title4,
              isLocalised: isLocalised,
              maxLines: 5,
            ),
            actions: <Widget>[
              FlatButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          );
        });
  }

  static confirmationAlert(
      {context,
      String title = '',
      String message = 'Are you sure? you want to continue',
      Function callBack}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(''),
          content: Text(message),
          actions: <Widget>[
            new FlatButton(
              onPressed: () => callBack("no"),
              child: Text('No'),
            ),
            FlatButton(
              onPressed: () => callBack("yes"),
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }
}

extension StringExt on String {
  isNull() {
    return this == null || this.isEmpty ? true : false;
  }

  time24String() {
    final t1Time = DateFormat.jm().parse(this);
    final t1str = DateFormat.Hm().format(t1Time);
    appPrint(t1str);
    return t1str;
  }
}
