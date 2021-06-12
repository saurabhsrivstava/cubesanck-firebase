import 'package:equatable/equatable.dart';

abstract class GigState extends Equatable {
  final List propss;
  GigState([this.propss]);

  @override
  List<Object> get props => (propss ?? []);
}

/// UnInitialized
class GigDefaultState extends GigState {
  GigDefaultState();

  @override
  String toString() => 'GigDefaultState';
}

/// Initialized
class GigDoneState extends GigState {
  GigDoneState() : super([]);

  @override
  String toString() => 'GigDoneState';
}

class GigLoadingState extends GigState {
  GigLoadingState() : super([]);

  @override
  String toString() => 'GigLoadingState';
}

class GigTagsDoneState extends GigState {
  GigTagsDoneState() : super([]);

  @override
  String toString() => 'GigTagsDoneState';
}

class ErrorGigState extends GigState {
  final String errorMessage;

  ErrorGigState(this.errorMessage) : super([errorMessage]);

  @override
  String toString() => 'ErrorGigState';
}
