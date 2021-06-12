import 'package:equatable/equatable.dart';

abstract class SellerPayoutState extends Equatable {
  final List propss;
  SellerPayoutState([this.propss]);

  @override
  List<Object> get props => (propss ?? []);
}

/// UnInitialized
class SellerPayoutDefaultState extends SellerPayoutState {
  SellerPayoutDefaultState();

  @override
  String toString() => 'SellerPayoutDefaultState';
}

/// Initialized
class SellerPayoutLoadingState extends SellerPayoutState {
  final String hello;

  SellerPayoutLoadingState(this.hello) : super([hello]);

  @override
  String toString() => 'SellerPayoutLoadingState $hello';
}

class SellerPayoutDoneState extends SellerPayoutState {
  final String hello;

  SellerPayoutDoneState(this.hello) : super([hello]);

  @override
  String toString() => 'SellerPayoutDoneState $hello';
}

class ErrorSellerPayoutState extends SellerPayoutState {
  final String errorMessage;

  ErrorSellerPayoutState(this.errorMessage) : super([errorMessage]);

  @override
  String toString() => 'ErrorSellerPayoutState';
}
