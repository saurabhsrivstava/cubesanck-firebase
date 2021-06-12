import 'dart:developer' as developer;


import 'package:cubesnack/Screens/WebSearch/Search/index_web.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WebSearchBloc extends Bloc<WebSearchEvent, WebSearchState> {

  WebSearchBloc(WebSearchState initialState) : super(initialState);

  @override
  Stream<WebSearchState> mapEventToState(
    WebSearchEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'WebSearchBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
