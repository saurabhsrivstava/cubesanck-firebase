import 'dart:async';
import 'dart:developer' as developer;
import 'package:bloc/bloc.dart';
import 'index.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {

  PaymentBloc({PaymentState initialState, })
      : super(initialState);

  @override
  Stream<PaymentState> mapEventToState(
    PaymentEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'PaymentBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
