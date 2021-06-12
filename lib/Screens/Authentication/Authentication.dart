import 'package:cubesnack/Screens/Notifications/Manager/NotificationManager.dart';
import 'package:cubesnack/Tabbar/AppTabbar.dart';
import 'package:cubesnack/Tabbar/Home/HomePage.dart';
import 'package:cubesnack/Utils/PlatformInfo.dart';
import 'package:cubesnack/Utils/TokenManager.dart';
import 'package:cubesnack/Utils/UserSession.dart';
import 'package:flutter/material.dart';

class Authentication extends StatelessWidget {
  const Authentication({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // UserSession.shared.freeLancerId = "f8129445-f30d-4309-b3fd-35ee63eb9bca";
    // UserSession.shared.lastFreelancerStep = 2;
    return FutureBuilder<Object>(
        future: TokenManager.getToken(context),
        builder: (context, snapshot) {
          return PlatformInfo.isDesktop(context)?HomePage():AppTabbar();
        });
  }
}
