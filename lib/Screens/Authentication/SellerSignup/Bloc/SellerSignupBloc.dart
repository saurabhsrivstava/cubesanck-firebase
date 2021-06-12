import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';

import 'index.dart';

class SellerSignupBloc extends Bloc<SellerSignupEvent, SellerSignupState> {
  SellerSignupBloc(SellerSignupState initialState) : super(initialState);

  @override
  Stream<SellerSignupState> mapEventToState(
    SellerSignupEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'SellerSignupBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
