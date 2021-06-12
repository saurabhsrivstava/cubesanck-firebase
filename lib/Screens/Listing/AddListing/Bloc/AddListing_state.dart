import 'package:cubesnack/Screens/Listing/AddListing/Models/MCategoryData.dart';
import 'package:cubesnack/Screens/Listing/AddListing/PriceAndVariations/Models/MVariationResponse.dart';
import 'package:equatable/equatable.dart';

abstract class AddListingState extends Equatable {
  final List propss;
  AddListingState([this.propss]);

  @override
  List<Object> get props => (propss ?? []);
}

/// UnInitialized
class ListingDefaultState extends AddListingState {
  ListingDefaultState();

  @override
  String toString() => 'ListingDefaultState';
}

/// Initialized
class ListingLoadingState extends AddListingState {
  ListingLoadingState() : super([]);

  @override
  String toString() => 'ListingLoadingState';
}

class ListingDoneState extends AddListingState {
  final String productId;
  ListingDoneState(this.productId) : super([productId]);

  @override
  String toString() => 'ListingDoneState $productId';
}

class CategoryDoneState extends AddListingState {
  final MCategoryResponse categories;
  CategoryDoneState({this.categories}) : super([categories]);

  @override
  String toString() => 'CategoryDoneState';
}

class VariationDoneState extends AddListingState {
  final MVariationResponse response;
  VariationDoneState({this.response}) : super([response]);

  @override
  String toString() => 'VariationDoneState';
}

class ErrorAddListingState extends AddListingState {
  final String errorMessage;

  ErrorAddListingState(this.errorMessage) : super([errorMessage]);

  @override
  String toString() => 'ErrorAddListingState';
}

class CreateProductVariantDoneState extends AddListingState {
  final MVariationResponse response;

  CreateProductVariantDoneState({this.response}) : super([response]);

  @override
  String toString() => 'CreateProductVariantDoneState';
}
