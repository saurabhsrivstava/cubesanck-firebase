import 'dart:async';
import 'dart:developer' as developer;
import 'package:cubesnack/Screens/Authentication/FreeLancer/Models/MFrPersonalInfo.dart';
import 'package:cubesnack/Screens/Authentication/FreeLancer/Models/MProfessionalInfo.dart';
import 'package:cubesnack/Services/ApiResponse.dart';
import 'package:cubesnack/Services/AppAPI.dart';
import 'package:cubesnack/Utils/UserSession.dart';
import 'package:meta/meta.dart';

import 'index.dart';

@immutable
abstract class FreeLancerEvent {
  Stream<FreeLancerState> applyAsync(
      {FreeLancerState currentState, FreeLancerBloc bloc});
}

class UnFreeLancerEvent extends FreeLancerEvent {
  @override
  Stream<FreeLancerState> applyAsync(
      {FreeLancerState currentState, FreeLancerBloc bloc}) async* {
    yield FreeLancerDefaultState();
  }
}

class AddFreeLancerEvent extends FreeLancerEvent {
  final MFrPersonalInfo personalInfo;
  AddFreeLancerEvent({this.personalInfo});

  @override
  Stream<FreeLancerState> applyAsync(
      {FreeLancerState currentState, FreeLancerBloc bloc}) async* {
    try {
      yield FreeLancerLoadingState();
      ApiResponse response =
          await AppApi().freeLancerRegister(body: personalInfo.toJson());
      if (response.status == APIStatus.COMPLETED) {
        if (response.data != null) {
          final id = response.data["id"];
          UserSession.shared.freeLancerId = id;
        }
        yield FreeLancerDoneState('Hello world');
      } else {
        yield ErrorFreeLancerState(response.message);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadFreeLancerEvent', error: _, stackTrace: stackTrace);
      yield ErrorFreeLancerState(_?.toString());
    }
  }
}

class UpdateFreeLancerEvent extends FreeLancerEvent {
  final body;
  UpdateFreeLancerEvent({this.body});

  @override
  Stream<FreeLancerState> applyAsync(
      {FreeLancerState currentState, FreeLancerBloc bloc}) async* {
    try {
      yield FreeLancerLoadingState();
      final id = UserSession.shared.freeLancerId;
      ApiResponse response =
          await AppApi().updateFreeLancer(body: body, id: id);
      if (response.status == APIStatus.COMPLETED) {
        yield FreeLancerDoneState('');
      } else {
        yield ErrorFreeLancerState(response.message);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadFreeLancerEvent', error: _, stackTrace: stackTrace);
      yield ErrorFreeLancerState(_?.toString());
    }
  }
}
