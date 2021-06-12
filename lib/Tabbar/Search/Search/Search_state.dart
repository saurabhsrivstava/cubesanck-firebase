import 'package:cubesnack/Screens/Products/Models/Products.dart';
import 'package:equatable/equatable.dart';

abstract class SearchState extends Equatable {
  final List propss;
  SearchState([this.propss]);

  @override
  List<Object> get props => (propss ?? []);
}

/// UnInitialized
class UnSearchState extends SearchState {
  UnSearchState();

  @override
  String toString() => 'UnSearchState';
}

class SearchLoadingState extends SearchState {
  SearchLoadingState();

  @override
  String toString() => 'SearchLoadingState';
}

class SearchDoneState extends SearchState {
  final List<Products> products;
  SearchDoneState({this.products});

  @override
  String toString() => 'SearchDoneState';
}

/// Initialized
class InSearchState extends SearchState {
  final String hello;

  InSearchState(this.hello) : super([hello]);

  @override
  String toString() => 'InSearchState $hello';
}

class ErrorSearchState extends SearchState {
  final String errorMessage;

  ErrorSearchState(this.errorMessage) : super([errorMessage]);

  @override
  String toString() => 'ErrorSearchState';
}
