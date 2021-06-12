import 'dart:io';

import 'package:cubesnack/Services/ApiResponse.dart';
import 'package:cubesnack/Services/AppAPI.dart';
import 'package:cubesnack/Utils/Util.dart';

class NotificationServices {
  registerToken(String token) async {
    final deviceType = Platform.isIOS ? "iOS" : "Android";
    ApiResponse response = await AppApi().registerDeviceToken(token: token);
    if (response.status == APIStatus.COMPLETED) {
      appPrint("device registered");
    } else {
      appPrint("device registered failed");
    }
  }
}
