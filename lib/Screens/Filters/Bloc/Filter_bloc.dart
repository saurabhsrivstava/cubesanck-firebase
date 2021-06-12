import 'dart:async';
import 'dart:developer' as developer;
import 'package:bloc/bloc.dart';

import 'index.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {

  FilterBloc(FilterState initialState) : super(initialState);

  @override
  Stream<FilterState> mapEventToState(
    FilterEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'FilterBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
