import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';

import 'index.dart';

class AddListingBloc extends Bloc<AddListingEvent, AddListingState> {
  AddListingBloc(AddListingState initialState) : super(initialState);

  @override
  Stream<AddListingState> mapEventToState(
    AddListingEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'AddListingBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
