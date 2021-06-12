import 'package:equatable/equatable.dart';

abstract class FreeLancerState extends Equatable {
  final List propss;
  FreeLancerState([this.propss]);

  @override
  List<Object> get props => (propss ?? []);
}

/// UnInitialized
class FreeLancerDefaultState extends FreeLancerState {
  FreeLancerDefaultState();

  @override
  String toString() => 'FreeLancerDefaultState';
}

class FreeLancerLoadingState extends FreeLancerState {
  FreeLancerLoadingState();

  @override
  String toString() => 'FreeLancerLoadingState';
}

/// Initialized
class FreeLancerDoneState extends FreeLancerState {
  final String hello;

  FreeLancerDoneState(this.hello) : super([hello]);

  @override
  String toString() => 'FreeLancerDoneState $hello';
}

class ErrorFreeLancerState extends FreeLancerState {
  final String errorMessage;

  ErrorFreeLancerState(this.errorMessage) : super([errorMessage]);

  @override
  String toString() => 'ErrorFreeLancerState';
}
