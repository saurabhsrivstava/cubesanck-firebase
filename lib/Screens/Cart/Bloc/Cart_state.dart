import 'package:cubesnack/Screens/Cart/Models/FastShippingResponse.dart';
import 'package:cubesnack/Screens/Cart/Models/MCartOrder.dart';
import 'package:cubesnack/Screens/Cart/Models/MUserCartResponse.dart';
import 'package:equatable/equatable.dart';

abstract class CartState extends Equatable {
  final List propss;
  CartState([this.propss]);

  @override
  List<Object> get props => (propss ?? []);
}

/// UnInitialized
class CartDefaultState extends CartState {
  CartDefaultState();

  @override
  String toString() => 'CartDefaultState';
}

/// Initialized
class CartDoneState extends CartState {
  final List<MCartItem> items;
  final String cartId;
  CartDoneState({this.items, this.cartId}) : super([items]);

  @override
  String toString() => 'InCartState';
}

class CartDeleteDoneState extends CartState {
  final List<MCartItem> items;
  CartDeleteDoneState({this.items}) : super([items]);

  @override
  String toString() => 'CartDeleteDoneState';
}

class CartLoadingState extends CartState {
  CartLoadingState() : super([]);

  @override
  String toString() => 'CartLoadingState';
}

class CartPriceDoneState extends CartState {
  final MCartOrder order;
  CartPriceDoneState({this.order}) : super([]);

  @override
  String toString() => 'CartPriceDoneState';
}

class CartInvoiceCreatedState extends CartState {
  final MCartOrder order;
  CartInvoiceCreatedState({this.order}) : super([]);

  @override
  String toString() => 'CartPriceDoneState';
}

class FastShippingDoneState extends CartState {
  final List<FastShipping> items;
  FastShippingDoneState({this.items}) : super([]);

  @override
  String toString() => 'FastShippingDoneState';
}

class ErrorCartState extends CartState {
  final String errorMessage;
  final List<MCartItem> items;

  ErrorCartState({this.errorMessage, this.items})
      : super([errorMessage, items]);

  @override
  String toString() => 'ErrorCartState';
}
