import 'package:cubesnack/Tabbar/Account/Screens/AccountSetting/Models/MUserProfile.dart';
import 'package:equatable/equatable.dart';

abstract class ProfileState extends Equatable {
  final List propss;
  ProfileState([this.propss]);

  @override
  List<Object> get props => (propss ?? []);
}

/// UnInitialized
class ProfileDefaultState extends ProfileState {
  ProfileDefaultState();

  @override
  String toString() => 'ProfileDefaultState';
}

class ProfileLoadingState extends ProfileState {
  ProfileLoadingState() : super([]);

  @override
  String toString() => 'ProfileLoadingState';
}

class ProfileDoneState extends ProfileState {
  final MUserProfile profile;
  ProfileDoneState({this.profile}) : super([profile]);

  @override
  String toString() => 'ProfileDoneState';
}

class ErrorProfileState extends ProfileState {
  final String errorMessage;

  ErrorProfileState(this.errorMessage) : super([errorMessage]);

  @override
  String toString() => 'ErrorProfileState';
}
