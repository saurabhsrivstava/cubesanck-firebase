import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';

import 'index.dart';

class FileUploadBloc extends Bloc<FileUploadEvent, FileUploadState> {

  FileUploadBloc(FileUploadState initialState) : super(initialState);

  @override
  Stream<FileUploadState> mapEventToState(
    FileUploadEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'FileUploadBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
