import 'dart:async';
import 'dart:developer' as developer;

import 'package:cubesnack/Screens/Notifications/Bloc/index.dart';
import 'package:cubesnack/Screens/Notifications/Models/MNotificationResponse.dart';
import 'package:cubesnack/Services/ApiResponse.dart';
import 'package:cubesnack/Services/AppAPI.dart';
import 'package:meta/meta.dart';

@immutable
abstract class NotificationEvent {
  Stream<NotificationState> applyAsync(
      {NotificationState currentState, NotificationBloc bloc});
}

class UnNotificationEvent extends NotificationEvent {
  @override
  Stream<NotificationState> applyAsync(
      {NotificationState currentState, NotificationBloc bloc}) async* {
    yield NotificationDefaultState();
  }
}

class LoadNotificationEvent extends NotificationEvent {
  @override
  Stream<NotificationState> applyAsync(
      {NotificationState currentState, NotificationBloc bloc}) async* {
    try {
      yield NotificationLoadingState();
      ApiResponse response = await AppApi().getAllNotifications();
      if (response.status == APIStatus.COMPLETED) {
        final MNotificationResponse data =
            MNotificationResponse.fromJson({"data": response.data});
        yield NotificationDoneState(data.data);
      } else {
        yield ErrorNotificationState(response.message);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadNotificationEvent', error: _, stackTrace: stackTrace);
      yield ErrorNotificationState(_?.toString());
    }
  }
}
