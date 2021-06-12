import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:cubesnack/Tabbar/Search/Search/index.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {

  SearchBloc(SearchState initialState) : super(initialState);

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'SearchBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
