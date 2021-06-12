import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:cubesnack/Screens/Notifications/Bloc/index.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc(NotificationState initialState) : super(initialState);

  @override
  Stream<NotificationState> mapEventToState(
    NotificationEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'NotificationBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
