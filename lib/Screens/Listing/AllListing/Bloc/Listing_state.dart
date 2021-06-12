import 'package:cubesnack/Screens/Listing/AllListing/Models/ProductListingResponse.dart';
import 'package:equatable/equatable.dart';

abstract class ListingState extends Equatable {
  final List propss;
  ListingState([this.propss]);

  @override
  List<Object> get props => (propss ?? []);
}

class ListingDefaultState extends ListingState {
  ListingDefaultState();

  @override
  String toString() => 'ListingDefaultState';
}

class ListingLoadingState extends ListingState {
  ListingLoadingState() : super([]);

  @override
  String toString() => 'InListingState';
}

class ListingDoneState extends ListingState {
  final List<MProductListing> productListing;

  ListingDoneState(this.productListing) : super([productListing]);

  @override
  String toString() => 'InListingState $productListing';
}

class ErrorListingState extends ListingState {
  final String errorMessage;

  ErrorListingState(this.errorMessage) : super([errorMessage]);

  @override
  String toString() => 'ErrorListingState';
}
