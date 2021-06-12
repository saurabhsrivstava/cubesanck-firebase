import 'package:equatable/equatable.dart';

abstract class ProductReviewState extends Equatable {
  final List propss;
  ProductReviewState([this.propss]);

  @override
  List<Object> get props => (propss ?? []);
}

/// UnInitialized
class ProductReviewDefaultState extends ProductReviewState {
  ProductReviewDefaultState();

  @override
  String toString() => 'ProductReviewDefaultState';
}

/// Initialized
class ProductReviewLoadingState extends ProductReviewState {
  ProductReviewLoadingState() : super([]);

  @override
  String toString() => 'ProductReviewLoadingState';
}

class ProductReviewDoneState extends ProductReviewState {
  final String hello;

  ProductReviewDoneState(this.hello) : super([hello]);

  @override
  String toString() => 'ProductReviewDoneState $hello';
}

class ErrorProductReviewState extends ProductReviewState {
  final String errorMessage;

  ErrorProductReviewState(this.errorMessage) : super([errorMessage]);

  @override
  String toString() => 'ErrorProductReviewState';
}
