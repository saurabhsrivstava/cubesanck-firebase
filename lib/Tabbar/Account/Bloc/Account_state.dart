import 'package:cubesnack/Screens/Authentication/SellerSignup/Pages/BusinessInfo/Models/BusinessInfo.dart';
import 'package:cubesnack/Screens/Products/Models/Products.dart';
import 'package:equatable/equatable.dart';

abstract class AccountState extends Equatable {
  final List propss;
  AccountState([this.propss]);

  @override
  List<Object> get props => (propss ?? []);
}

/// UnInitialized
class AccountDefaultState extends AccountState {
  AccountDefaultState();

  @override
  String toString() => 'AccountDefaultState';
}

/// Initialized
class AccountLoadingState extends AccountState {
  AccountLoadingState() : super([]);

  @override
  String toString() => 'AccountLoadingState';
}

class AddressDoneState extends AccountState {
  final List<MUserAddress> address;
  AddressDoneState({this.address}) : super([address]);

  @override
  String toString() => 'AddressDoneState';
}

class HistoryDoneState extends AccountState {
  final List<Products> products;
  HistoryDoneState({this.products}) : super([products]);

  @override
  String toString() => 'HistoryDoneState';
}

class AccountDoneState extends AccountState {
  AccountDoneState() : super([]);

  @override
  String toString() => 'AccountDoneState';
}

class AddressPickedState extends AccountState {
  final MUserAddress address;

  AddressPickedState({this.address}) : super([]);

  @override
  String toString() => 'AddressPickedState';
}

class ErrorAccountState extends AccountState {
  final String errorMessage;

  ErrorAccountState(this.errorMessage) : super([errorMessage]);

  @override
  String toString() => 'ErrorAccountState';
}
