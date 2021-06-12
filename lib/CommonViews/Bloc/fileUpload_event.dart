import 'dart:async';
import 'dart:developer' as developer;

import 'package:cubesnack/Utils/ImageUploader.dart';
import 'package:flutter_absolute_path/flutter_absolute_path.dart';
import 'package:meta/meta.dart';

import 'index.dart';

@immutable
abstract class FileUploadEvent {
  Stream<FileUploadState> applyAsync(
      {FileUploadState currentState, FileUploadBloc bloc});
}

class UnFileUploadEvent extends FileUploadEvent {
  @override
  Stream<FileUploadState> applyAsync(
      {FileUploadState currentState, FileUploadBloc bloc}) async* {
    yield DefaultFileUploadState();
  }
}

class UploadFileEvent extends FileUploadEvent {
  final String url;
  final bool isAsset;
  UploadFileEvent({this.url, this.isAsset = false});
  @override
  Stream<FileUploadState> applyAsync(
      {FileUploadState currentState, FileUploadBloc bloc}) async* {
    try {
      yield FileUploadProcessingState();
      ImageUploader uploader = ImageUploader();
      final path = await FlutterAbsolutePath.getAbsolutePath(this.url);
      final FileUploadResponse responnse =
          await uploader.upload(isAsset ? path : url);
      if (responnse.status) {
        yield FileUploadDoneState(responnse: responnse);
      } else {
        yield ErrorFileUploadState("Image upload failed");
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadFileUploadEvent', error: _, stackTrace: stackTrace);
      yield ErrorFileUploadState(_?.toString());
    }
  }
}
