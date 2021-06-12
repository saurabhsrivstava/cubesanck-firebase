import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:cubesnack/Screens/SellerPayout/Bloc/index.dart';

class SellerPayoutBloc extends Bloc<SellerPayoutEvent, SellerPayoutState> {
  SellerPayoutBloc(SellerPayoutState initialState) : super(initialState);

  @override
  Stream<SellerPayoutState> mapEventToState(
    SellerPayoutEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'SellerPayoutBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
