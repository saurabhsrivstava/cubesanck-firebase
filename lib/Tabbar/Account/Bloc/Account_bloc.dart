import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';

import 'index.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {

  AccountBloc(AccountState initialState) : super(initialState);

  @override
  Stream<AccountState> mapEventToState(
    AccountEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'AccountBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
