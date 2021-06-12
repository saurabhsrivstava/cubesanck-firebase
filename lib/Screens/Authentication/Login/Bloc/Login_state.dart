import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  final List propss;
  LoginState([this.propss]);

  @override
  List<Object> get props => (propss ?? []);
}

/// UnInitialized
class UnLoginState extends LoginState {
  UnLoginState();

  @override
  String toString() => 'UnLoginState';
}

class LoginLoadingState extends LoginState {
  LoginLoadingState();

  @override
  String toString() => 'LoginLoadingState';
}

class LoginDoneState extends LoginState {
  LoginDoneState();
  @override
  String toString() => 'LoginDoneState';
}

/// Initialized
class InLoginState extends LoginState {
  final String hello;

  InLoginState(this.hello) : super([hello]);

  @override
  String toString() => 'InLoginState $hello';
}

class ErrorLoginState extends LoginState {
  final String errorMessage;

  ErrorLoginState(this.errorMessage) : super([errorMessage]);

  @override
  String toString() => 'ErrorLoginState';
}
