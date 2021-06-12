import 'dart:async';
import 'dart:developer' as developer;

import 'package:cubesnack/Services/AppAPI.dart';
import 'package:meta/meta.dart';

import 'index.dart';

@immutable
abstract class GigEvent {
  Stream<GigState> applyAsync({GigState currentState, GigBloc bloc});
}

class UnGigEvent extends GigEvent {
  @override
  Stream<GigState> applyAsync({GigState currentState, GigBloc bloc}) async* {
    yield GigDefaultState();
  }
}

class CreateGigEvent extends GigEvent {
  @override
  Stream<GigState> applyAsync({GigState currentState, GigBloc bloc}) async* {
    try {
      yield GigLoadingState();
      await AppApi().createGig();
      yield GigDoneState();
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadGigEvent', error: _, stackTrace: stackTrace);
      yield ErrorGigState(_?.toString());
    }
  }
}

class UpdateGigEvent extends GigEvent {
  @override
  Stream<GigState> applyAsync({GigState currentState, GigBloc bloc}) async* {
    try {
      yield GigLoadingState();
      await AppApi().updateGig();
      yield GigDoneState();
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadGigEvent', error: _, stackTrace: stackTrace);
      yield ErrorGigState(_?.toString());
    }
  }
}

class LoadGigTagsEvent extends GigEvent {
  @override
  Stream<GigState> applyAsync({GigState currentState, GigBloc bloc}) async* {
    try {
      yield GigLoadingState();
      await AppApi().updateGig();
      yield GigDoneState();
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadGigEvent', error: _, stackTrace: stackTrace);
      yield ErrorGigState(_?.toString());
    }
  }
}
