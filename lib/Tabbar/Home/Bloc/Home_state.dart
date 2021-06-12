import 'package:cubesnack/Screens/Products/Models/Products.dart';
import 'package:cubesnack/Tabbar/Home/Models/MHomeSuffixResponse.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  final List propss;
  HomeState([this.propss]);

  @override
  List<Object> get props => (propss ?? []);
}

/// UnInitialized
class DefaultHomeState extends HomeState {
  DefaultHomeState();
  @override
  String toString() => 'DefaultHomeState';
}

class DoneHomeState extends HomeState {
  final List<Categories> categories;

  DoneHomeState({this.categories}) : super([]);

  @override
  String toString() => 'InHomeState';
}

class HomeProductDoneState extends HomeState {
  final List<Products> products;

  HomeProductDoneState({this.products}) : super([]);

  @override
  String toString() => 'InHomeState';
}

class ProductDescriptionDoneState extends HomeState {
  final Products product;

  ProductDescriptionDoneState({this.product}) : super([]);

  @override
  String toString() => 'InHomeState';
}

class HomeLoadingState extends HomeState {
  HomeLoadingState() : super([]);

  @override
  String toString() => 'HomeLoadingState';
}

class ErrorHomeState extends HomeState {
  final String errorMessage;

  ErrorHomeState(this.errorMessage) : super([errorMessage]);

  @override
  String toString() => 'ErrorHomeState';
}

class AddingCartDoneState extends HomeState {
  final Products product;

  AddingCartDoneState({this.product}) : super([product]);

  @override
  String toString() => 'AddingCartDoneState';
}
