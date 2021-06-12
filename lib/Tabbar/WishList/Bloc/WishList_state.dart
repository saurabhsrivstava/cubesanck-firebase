import 'package:cubesnack/Screens/Products/Models/Products.dart';
import 'package:equatable/equatable.dart';

abstract class WishListState extends Equatable {
  final List propss;
  WishListState([this.propss]);

  @override
  List<Object> get props => (propss ?? []);
}

/// UnInitialized
class WishListDefaultState extends WishListState {
  WishListDefaultState();

  @override
  String toString() => 'WishListDefaultState';
}

class WishListLoadingState extends WishListState {
  WishListLoadingState();

  @override
  String toString() => 'WishListLoadingState';
}

class AddFavoriteDoneState extends WishListState {
  final bool isWishList;
  AddFavoriteDoneState({this.isWishList = false});

  @override
  String toString() => 'AddFavoriteDoneState';
}

/// Initialized
class WishListDoneState extends WishListState {
  final List<Products> items;

  WishListDoneState(this.items) : super([items]);

  @override
  String toString() => 'WishListDoneState';
}

class ErrorWishListState extends WishListState {
  final String errorMessage;

  ErrorWishListState(this.errorMessage) : super([errorMessage]);

  @override
  String toString() => 'ErrorWishListState';
}
