import 'package:cubesnack/Screens/Payments/Models/MCardList.dart';
import 'package:equatable/equatable.dart';

abstract class PaymentState extends Equatable {
  final List propss;
  PaymentState([this.propss]);

  @override
  List<Object> get props => (propss ?? []);
}

/// UnInitialized
class CardDefaultState extends PaymentState {
  CardDefaultState();

  @override
  String toString() => 'CardDefaultState';
}

/// Initialized
class CardFetchDoneState extends PaymentState {
  final List<MCard> cards;

  CardFetchDoneState({this.cards}) : super([cards]);

  @override
  String toString() => 'CardFetchDoneState $cards';
}

class AddCardDoneState extends PaymentState {
  AddCardDoneState() : super([]);

  @override
  String toString() => 'AddCardDoneState';
}

class CardLoadingState extends PaymentState {
  CardLoadingState() : super([]);

  @override
  String toString() => 'CardLoadingState';
}

class CardSelectedDoneState extends PaymentState {
  final MCard card;
  CardSelectedDoneState({this.card}) : super([card]);

  @override
  String toString() => 'CardSelectedDoneState';
}

class CartPaymentDoneState extends PaymentState {
  final bool isInvoice;
  final String orderId;
  CartPaymentDoneState({this.isInvoice = false, this.orderId}) : super([]);

  @override
  String toString() => 'CartPaymentDoneState';
}

class ErrorPaymentState extends PaymentState {
  final String errorMessage;

  ErrorPaymentState(this.errorMessage) : super([errorMessage]);

  @override
  String toString() => 'ErrorPaymentState';
}
