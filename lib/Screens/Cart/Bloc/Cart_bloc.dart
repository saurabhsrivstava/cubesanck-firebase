import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'index.dart';

class CartBloc extends Bloc<CartEvent, CartState> {

  CartBloc(CartState initialState) : super(initialState);

  @override
  Stream<CartState> mapEventToState(
    CartEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'CartBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
