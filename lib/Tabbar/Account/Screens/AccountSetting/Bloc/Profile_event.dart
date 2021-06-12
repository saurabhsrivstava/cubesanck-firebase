import 'dart:async';
import 'dart:developer' as developer;

import 'package:cubesnack/Services/ApiResponse.dart';
import 'package:cubesnack/Services/AppAPI.dart';
import 'package:cubesnack/Tabbar/Account/Screens/AccountSetting/Models/MUserProfile.dart';
import 'package:meta/meta.dart';

import 'index.dart';

@immutable
abstract class ProfileEvent {
  Stream<ProfileState> applyAsync(
      {ProfileState currentState, ProfileBloc bloc});
}

class UnProfileEvent extends ProfileEvent {
  @override
  Stream<ProfileState> applyAsync(
      {ProfileState currentState, ProfileBloc bloc}) async* {
    yield ProfileDefaultState();
  }
}

class LoadProfileEvent extends ProfileEvent {
  @override
  Stream<ProfileState> applyAsync(
      {ProfileState currentState, ProfileBloc bloc}) async* {
    try {
      yield ProfileLoadingState();
      final ApiResponse response = await AppApi().userProfile(null);
      if (response.status == APIStatus.COMPLETED) {
        final profile = MUserProfile.fromJson(response.data);
        yield ProfileDoneState(profile: profile);
      } else {
        yield ErrorProfileState(response.message);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadProfileEvent', error: _, stackTrace: stackTrace);
      yield ErrorProfileState(_?.toString());
    }
  }
}

class UpdateProfileEvent extends ProfileEvent {
  final MUserProfile profile;
  UpdateProfileEvent({this.profile});
  @override
  Stream<ProfileState> applyAsync(
      {ProfileState currentState, ProfileBloc bloc}) async* {
    try {
      yield ProfileLoadingState();
      final body = profile.toJson();
      final ApiResponse response = await AppApi().userProfile(body);
      if (response.status == APIStatus.COMPLETED) {
        final profile = MUserProfile.fromJson(response.data);
        yield ProfileDoneState(profile: profile);
      } else {
        yield ErrorProfileState(response.message);
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadProfileEvent', error: _, stackTrace: stackTrace);
      yield ErrorProfileState(_?.toString());
    }
  }
}
