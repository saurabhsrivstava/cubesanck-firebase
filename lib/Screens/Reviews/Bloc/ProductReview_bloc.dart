import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:cubesnack/Screens/Reviews/Bloc/index.dart';

class ProductReviewBloc extends Bloc<ProductReviewEvent, ProductReviewState> {
  ProductReviewBloc(ProductReviewState initialState) : super(initialState);

  @override
  Stream<ProductReviewState> mapEventToState(
    ProductReviewEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'ProductReviewBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
