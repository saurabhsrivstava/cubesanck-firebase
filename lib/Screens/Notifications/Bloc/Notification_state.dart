import 'package:cubesnack/Screens/Notifications/Models/MNotificationResponse.dart';
import 'package:equatable/equatable.dart';

abstract class NotificationState extends Equatable {
  final List propss;
  NotificationState([this.propss]);

  @override
  List<Object> get props => (propss ?? []);
}

/// UnInitialized
class NotificationDefaultState extends NotificationState {
  NotificationDefaultState();

  @override
  String toString() => 'NotificationDefaultState';
}

/// Initialized
class NotificationDoneState extends NotificationState {
  final List<MNotificationData> notifications;

  NotificationDoneState(this.notifications) : super([notifications]);

  @override
  String toString() => 'NotificationDoneState $notifications';
}

class NotificationLoadingState extends NotificationState {
  NotificationLoadingState() : super([]);

  @override
  String toString() => 'NotificationLoadingState';
}

class ErrorNotificationState extends NotificationState {
  final String errorMessage;

  ErrorNotificationState(this.errorMessage) : super([errorMessage]);

  @override
  String toString() => 'ErrorNotificationState';
}
