import 'package:cubesnack/Screens/Authentication/SellerSignup/Pages/BusinessInfo/Models/MStore.dart';
import 'package:cubesnack/Screens/Listing/AddListing/Models/MCategoryData.dart';
import 'package:equatable/equatable.dart';

abstract class FilterState extends Equatable {
  final List propss;
  FilterState([this.propss]);

  @override
  List<Object> get props => (propss ?? []);
}

/// UnInitialized
class FilterDefaultState extends FilterState {
  FilterDefaultState();

  @override
  String toString() => 'FilterDefaultState';
}

/// Initialized
class FilterCategoryDoneState extends FilterState {
  final List<MCategoryData> categories;
  FilterCategoryDoneState({this.categories}) : super([categories]);

  @override
  String toString() => 'FilterDoneState';
}

class FilterStoreDoneState extends FilterState {
  final List<dynamic> stores;
  FilterStoreDoneState({this.stores}) : super([stores]);

  @override
  String toString() => 'FilterDoneState';
}

class FilterLoadingState extends FilterState {
  FilterLoadingState() : super([]);

  @override
  String toString() => 'FilterLoadingState';
}

class ErrorFilterState extends FilterState {
  final String errorMessage;

  ErrorFilterState(this.errorMessage) : super([errorMessage]);

  @override
  String toString() => 'ErrorFilterState';
}
