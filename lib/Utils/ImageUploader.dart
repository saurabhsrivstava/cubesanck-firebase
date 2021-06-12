import 'dart:convert';
import 'dart:io';
import 'package:cubesnack/Constants/Constants.dart';
import 'package:cubesnack/Utils/UserSession.dart';
import 'package:cubesnack/Utils/Util.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'package:path/path.dart';

class ImageUploader {
  upload(file) async {
    final token = UserSession.shared.getToken();
    final headers = {
      'Authorization': 'Bearer $token',
      "content-type": "multipart/form-data",
    };
    final compressedFile = File(file);

    // File compressedFile = await FlutterNativeImage.compressImage(baseFile.path,
    // quality: 50, percentage: 50);

    final url = BASE_URL + UPLOAD;

    // open a bytestream
    var stream =
        new http.ByteStream(DelegatingStream.typed(compressedFile.openRead()));
    // get file length
    var length = await compressedFile.length();
    // string to uri
    var uri = Uri.parse(url);

    // create multipart request
    var request = new http.MultipartRequest(
      "POST",
      uri,
    );
    request.headers.addAll(headers);

    // multipart that takes file
    final splittedExtension =
        basename(compressedFile.path).split('/').last.split('.');
    final extension = splittedExtension.last.toLowerCase();
    var multipartFile = new http.MultipartFile('files', stream, length,
        filename: 'profile_image.$extension');

    // add file to multipart
    request.files.add(multipartFile);
    var response = await request.send();

    appPrint(" Fileupload: ${response.statusCode}");

    if (response.statusCode >= 200 && response.statusCode <= 300) {
      final respStr = await response.stream.bytesToString();
      final finalResponse = json.decode(respStr);
      final fileUploadResponnse = FileUploadResponse.fromJson(finalResponse);
      fileUploadResponnse.status = true;
      appPrint(finalResponse);
      return fileUploadResponnse;
    } else {
      final fileUploadResponnse = FileUploadResponse(status: false);
      return fileUploadResponnse;
    }
  }
}

class FileUploadResponse {
  List<String> ids;
  bool status;

  FileUploadResponse({this.ids, this.status});

  FileUploadResponse.fromJson(Map<String, dynamic> json) {
    ids = json['ids'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ids'] = this.ids;
    return data;
  }
}
