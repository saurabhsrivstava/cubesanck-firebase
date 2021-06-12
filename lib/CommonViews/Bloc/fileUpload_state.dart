import 'package:cubesnack/Utils/ImageUploader.dart';
import 'package:equatable/equatable.dart';

abstract class FileUploadState extends Equatable {
  final List propss;
  FileUploadState([this.propss]);

  @override
  List<Object> get props => (propss ?? []);
}

/// UnInitialized
class DefaultFileUploadState extends FileUploadState {
  DefaultFileUploadState();

  @override
  String toString() => 'DefaultFileUploadState';
}

class FileUploadDoneState extends FileUploadState {
  final FileUploadResponse responnse;
  FileUploadDoneState({this.responnse}) : super([]);
  @override
  String toString() => 'InFileUploadState';
}

class FileUploadProcessingState extends FileUploadState {
  FileUploadProcessingState() : super([]);
  @override
  String toString() => 'InFileUploadState';
}

class ErrorFileUploadState extends FileUploadState {
  final String errorMessage;

  ErrorFileUploadState(this.errorMessage) : super([errorMessage]);

  @override
  String toString() => 'ErrorFileUploadState';
}
