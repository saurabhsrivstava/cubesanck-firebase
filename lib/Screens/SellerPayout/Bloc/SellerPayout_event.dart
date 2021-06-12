import 'dart:async';
import 'dart:developer' as developer;

import 'package:cubesnack/Screens/SellerPayout/Bloc/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SellerPayoutEvent {
  Stream<SellerPayoutState> applyAsync(
      {SellerPayoutState currentState, SellerPayoutBloc bloc});
}

class UnSellerPayoutEvent extends SellerPayoutEvent {
  @override
  Stream<SellerPayoutState> applyAsync(
      {SellerPayoutState currentState, SellerPayoutBloc bloc}) async* {
    yield SellerPayoutDefaultState();
  }
}

class LoadSellerPayoutEvent extends SellerPayoutEvent {
  @override
  Stream<SellerPayoutState> applyAsync(
      {SellerPayoutState currentState, SellerPayoutBloc bloc}) async* {
    try {
      yield SellerPayoutLoadingState("");
      await Future.delayed(Duration(seconds: 1));
      yield SellerPayoutDoneState('Hello world');
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadSellerPayoutEvent', error: _, stackTrace: stackTrace);
      yield ErrorSellerPayoutState(_?.toString());
    }
  }
}
