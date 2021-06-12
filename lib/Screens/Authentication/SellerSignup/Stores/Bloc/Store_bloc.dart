import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';

import 'index.dart';

class StoreBloc extends Bloc<StoreEvent, StoreState> {

  StoreBloc(StoreState initialState) : super(initialState);

  @override
  Stream<StoreState> mapEventToState(
    StoreEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'StoreBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
