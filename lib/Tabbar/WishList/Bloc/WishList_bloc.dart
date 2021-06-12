import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';

import 'index.dart';

class WishListBloc extends Bloc<WishListEvent, WishListState> {

  WishListBloc(WishListState initialState) : super(initialState);

  @override
  Stream<WishListState> mapEventToState(
    WishListEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'WishListBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
