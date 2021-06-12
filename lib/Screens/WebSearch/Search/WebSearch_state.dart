import 'package:cubesnack/Screens/Products/Models/Products.dart';
import 'package:equatable/equatable.dart';

abstract class WebSearchState extends Equatable {
  final List propss;
  WebSearchState([this.propss]);

  @override
  List<Object> get props => (propss ?? []);
}

/// UnInitialized
class UnSearchState extends WebSearchState {
  UnSearchState();

  @override
  String toString() => 'UnSearchState';
}

class SearchLoadingState extends WebSearchState {
  SearchLoadingState();

  @override
  String toString() => 'SearchLoadingState';
}

class SearchDoneState extends WebSearchState {
  final List<Products> products;
  SearchDoneState({this.products});

  @override
  String toString() => 'SearchDoneState';
}

/// Initialized
class InSearchState extends WebSearchState {
  final String hello;

  InSearchState(this.hello) : super([hello]);

  @override
  String toString() => 'InSearchState $hello';
}

class ErrorSearchState extends WebSearchState {
  final String errorMessage;

  ErrorSearchState(this.errorMessage) : super([errorMessage]);

  @override
  String toString() => 'ErrorSearchState';
}
