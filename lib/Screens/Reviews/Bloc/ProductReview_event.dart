import 'dart:async';
import 'dart:developer' as developer;
import 'package:cubesnack/Screens/Reviews/Bloc/index.dart';
import 'package:cubesnack/Services/ApiResponse.dart';
import 'package:cubesnack/Services/AppAPI.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ProductReviewEvent {
  Stream<ProductReviewState> applyAsync(
      {ProductReviewState currentState, ProductReviewBloc bloc});
}

class UnProductReviewEvent extends ProductReviewEvent {
  @override
  Stream<ProductReviewState> applyAsync(
      {ProductReviewState currentState, ProductReviewBloc bloc}) async* {
    yield ProductReviewDefaultState();
  }
}

class AddProductReviewEvent extends ProductReviewEvent {
  final String productId;
  final body;
  AddProductReviewEvent({this.body, this.productId});
  @override
  Stream<ProductReviewState> applyAsync(
      {ProductReviewState currentState, ProductReviewBloc bloc}) async* {
    try {
      yield ProductReviewLoadingState();
      final ApiResponse response =
          await AppApi().addProductReview(productId: productId, body: body);
      if (response.status == APIStatus.COMPLETED) {
        yield ProductReviewDoneState("");
      } else {
        yield ErrorProductReviewState(response.message);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadProductReviewEvent', error: _, stackTrace: stackTrace);
      yield ErrorProductReviewState(_?.toString());
    }
  }
}
