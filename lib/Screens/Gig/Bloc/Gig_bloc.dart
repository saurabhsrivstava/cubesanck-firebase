import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';

import 'index.dart';

class GigBloc extends Bloc<GigEvent, GigState> {
  GigBloc(GigState initialState) : super(initialState);

  @override
  Stream<GigState> mapEventToState(
    GigEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'GigBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
