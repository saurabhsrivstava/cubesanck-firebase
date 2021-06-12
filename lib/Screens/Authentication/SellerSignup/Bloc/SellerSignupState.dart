import 'package:cubesnack/Screens/Authentication/SellerSignup/Pages/BusinessInfo/Models/BusinessInfo.dart';
import 'package:cubesnack/Screens/Authentication/SellerSignup/Pages/BusinessInfo/Models/MStore.dart';
import 'package:cubesnack/Screens/Products/Models/MReturn.dart';
import 'package:equatable/equatable.dart';

abstract class SellerSignupState extends Equatable {
  final List propss;
  SellerSignupState([this.propss]);

  @override
  List<Object> get props => (propss ?? []);
}

/// UnInitialized
class SellerSignupDefaultState extends SellerSignupState {
  SellerSignupDefaultState();

  @override
  String toString() => 'SellerSignupDefaultState';
}

class SellerSignupLoadingState extends SellerSignupState {
  SellerSignupLoadingState() : super([]);

  @override
  String toString() => 'SellerSignupLoadingState';
}

class SellerSignupDoneState extends SellerSignupState {
  final String id;
  final BusinessInfo data;
  final MStore store;
  SellerSignupDoneState({this.id, this.data, this.store}) : super([]);

  @override
  String toString() => 'SellerSignupDoneState';
}

class StoreLoadingDoneState extends SellerSignupState {
  final List<MStore> store;
  StoreLoadingDoneState({this.store}) : super([]);

  @override
  String toString() => 'StoreLoadingDoneState';
}

class FetchingReturnDoneState extends SellerSignupState {
  final List<MReturn> items;
  FetchingReturnDoneState({this.items}) : super([]);

  @override
  String toString() => 'FetchingReturnDoneState';
}

class SellerSignupErrorState extends SellerSignupState {
  final String errorMessage;

  SellerSignupErrorState(this.errorMessage) : super([errorMessage]);

  @override
  String toString() => 'SellerSignupErrorState';
}
