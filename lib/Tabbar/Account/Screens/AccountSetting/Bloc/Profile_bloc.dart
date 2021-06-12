import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';

import 'index.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {

  ProfileBloc(ProfileState initialState) : super(initialState);

  @override
  Stream<ProfileState> mapEventToState(
    ProfileEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'ProfileBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
