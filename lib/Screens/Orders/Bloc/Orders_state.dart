import 'package:cubesnack/Screens/Orders/Models/MOrderResponse.dart';
import 'package:equatable/equatable.dart';

abstract class OrdersState extends Equatable {
  final List propss;
  OrdersState([this.propss]);

  @override
  List<Object> get props => (propss ?? []);
}

/// UnInitialized
class OrdersDefaultState extends OrdersState {
  OrdersDefaultState();

  @override
  String toString() => 'OrdersDefaultState';
}

/// Initialized
class OrdersLoadingState extends OrdersState {
  OrdersLoadingState() : super([]);
  @override
  String toString() => 'InOrdersState ';
}

class OrdersDoneState extends OrdersState {
  final List<MOrder> items;
  OrdersDoneState({this.items}) : super([items]);
  @override
  String toString() => 'OrdersDoneState ';
}

class OrderStatusUpdatedState extends OrdersState {
  final String message;
  OrderStatusUpdatedState({this.message}) : super([message]);
  @override
  String toString() => 'OrdersDoneState ';
}

class ErrorOrdersState extends OrdersState {
  final String errorMessage;

  ErrorOrdersState(this.errorMessage) : super([errorMessage]);

  @override
  String toString() => 'ErrorOrdersState';
}
