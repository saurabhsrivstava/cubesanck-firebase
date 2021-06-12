import 'package:cubesnack/Screens/Authentication/SellerSignup/Stores/Models/MStoreList.dart';
import 'package:equatable/equatable.dart';

abstract class StoreState extends Equatable {
  final List propss;
  StoreState([this.propss]);

  @override
  List<Object> get props => (propss ?? []);
}

/// UnInitialized
class StoreDefaultState extends StoreState {
  StoreDefaultState();

  @override
  String toString() => 'StoreDefaultState';
}

/// Initialized
class StoreLoadingState extends StoreState {
  StoreLoadingState() : super([]);

  @override
  String toString() => 'StoreLoadingState';
}

class StoreDoneState extends StoreState {
  final MStoreList stores;
  StoreDoneState({this.stores}) : super([]);

  @override
  String toString() => 'StoreDoneState';
}

class ErrorStoreState extends StoreState {
  final String errorMessage;

  ErrorStoreState(this.errorMessage) : super([errorMessage]);

  @override
  String toString() => 'ErrorStoreState';
}
