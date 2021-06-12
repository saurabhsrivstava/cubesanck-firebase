import 'dart:async';
import 'dart:developer' as developer;
import 'package:bloc/bloc.dart';
import 'index.dart';

class ListingBloc extends Bloc<ListingEvent, ListingState> {
  ListingBloc(ListingState initialState) : super(initialState);

  @override
  Stream<ListingState> mapEventToState(
    ListingEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'ListingBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
