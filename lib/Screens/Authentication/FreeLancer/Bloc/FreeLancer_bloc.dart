import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'index.dart';

class FreeLancerBloc extends Bloc<FreeLancerEvent, FreeLancerState> {
  FreeLancerBloc(FreeLancerState initialState) : super(initialState);

  @override
  Stream<FreeLancerState> mapEventToState(
    FreeLancerEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'FreeLancerBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
