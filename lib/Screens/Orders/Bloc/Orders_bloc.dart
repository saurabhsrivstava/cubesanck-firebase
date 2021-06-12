import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:cubesnack/Screens/Orders/Bloc/index.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  OrdersBloc(OrdersState initialState) : super(initialState);

  @override
  Stream<OrdersState> mapEventToState(
    OrdersEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'OrdersBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
