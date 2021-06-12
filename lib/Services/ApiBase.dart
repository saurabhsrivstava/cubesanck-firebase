import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:cubesnack/Constants/Constants.dart';
import 'package:cubesnack/Utils/UserSession.dart';
import 'package:cubesnack/Utils/Util.dart';
import 'package:http/http.dart' as http;
import 'ApiResponse.dart';
import 'AppException.dart';
import 'StringConstants.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

/// Network class for sending api response
abstract class ApiBase {
  final String url;
  ApiBase({this.url});

  Future<dynamic> get() async {
    final headers = _getHeaders();
    // headers["Authorization"] = "eyJhbGciOiJFUzUxMiJ9.eyJ1c2VyIjp7ImlkIjoxLCJ1c2VyX3R5cGUiOiJhZG1pbiJ9LCJleHAiOjE2MDQzMzc2MTB9.AJS8XvhvbwLak6rGzzVxNGA20w1jXLQgM2OwXIvQUXc2jyxX_holSqfQi00tP3auaKy4Qbcidfz4R7LiJHzaFs11AJHkgIpr2Ga1hixuzlGA0Es71L8mxRT_SWvR9dFwrIbI7dEA557MBhE90SWZIDNFtagE6Mb4uCYhg_0v1d76JPNq";
    appPrint(headers["Authorization"]);
    try {
      final response = await http.get(url, headers: headers);
      final ApiResponse responseJson = _processResponse(response);
      return responseJson;
    } on SocketException {
      throw FetchDataException(StringConstants.noInternetConnection);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ApiResponse> post(Object body) async {
    final headers = await _getHeaders();

    ApiResponse responseJson;
    try {
      final response =
          await http.post(url, body: json.encode(body), headers: headers);
      appPrint(json.encode(body));
      appPrint("response:: ${response.body}");
      responseJson = _processResponse(response);
      return responseJson;
    } on SocketException {
      throw FetchDataException(StringConstants.noInternetConnection);
    } catch (error) {
      return ApiResponse.error(error.toString());
    }
  }

  Future<ApiResponse> delete() async {
    final headers = await _getHeaders();

    ApiResponse responseJson;
    try {
      final response = await http.delete(url, headers: headers);
      responseJson = _processResponse(response);
      return responseJson;
    } on SocketException {
      throw FetchDataException(StringConstants.noInternetConnection);
    } catch (error) {
      return ApiResponse.error(error.toString());
    }
  }

  Future<ApiResponse> patch(Map body) async {
    final headers = await _getHeaders();

    ApiResponse responseJson;
    try {
      final response =
          await http.patch(url, body: json.encode(body), headers: headers);
      responseJson = _processResponse(response);
      return responseJson;
    } on SocketException {
      throw FetchDataException(StringConstants.noInternetConnection);
    } catch (error) {
      return ApiResponse.error(error.toString());
    }
  }

  ApiResponse _processResponse(http.Response response) {
    ApiResponse apiResponse = ApiResponse.error(response.body.toString());
    switch (response.statusCode) {
      case HttpStatus.created:
      case HttpStatus.ok:
        final data = response.body != null && response.body.length > 0
            ? json.decode(response.body)
            : "";
        // if (data.containsKey("token") && data["token"] != null)
        //   UserSession.shared.setToken(data["token"]);
        apiResponse = ApiResponse.complete(data);
        break;
      case HttpStatus.badRequest:
        return _getError(response);
      //throw BadRequestException(response.body.toString());

      case HttpStatus.unauthorized:
        throw UnauthorisedException(response.body.toString());

      case HttpStatus.forbidden:
        throw UnauthorisedException(response.body.toString());

      case HttpStatus.notFound:
        apiResponse = ApiResponse.error(StringConstants.notFound);
        break;

      case HttpStatus.internalServerError:
        throw UnauthorisedException(response.body.toString());

      case HttpStatus.serviceUnavailable:
        throw UnauthorisedException(StringConstants.serviceUnavailable);

      default:
        final data = response.body != null && response.body.length > 0
            ? json.decode(response.body)
            : "";
        String message;
        if (data.containsKey("detail")) {
          message = data["detail"];
        }
        apiResponse = ApiResponse.error(message ?? "Something went wrong");
        appPrint("error: $data");
    }
    return apiResponse;
  }

  _getError(response) {
    final data = response.body != null && response.body.length > 0
        ? json.decode(response.body)
        : "";
    String message;
    if (data.containsKey("detail")) {
      message = data["detail"];
    }
    return ApiResponse.error(message ?? "Something went wrong");
  }

  _getHeaders() {
    String os;

    if (kIsWeb) {
    } else {
      os = Platform.isAndroid ? "Android" : "iOS";
    }

    final String token = UserSession.shared.getToken();
    final headers = {
      //'Authorization': 'Bearer $token',
      "Content-Type": "application/json",
      "Accept": "application/json",
      "os": os
    };
    if (token != null && token.length > 0) {
      headers["Authorization"] = 'Bearer $token';
    }
    return headers;
  }
}

class APIServiceManager extends ApiBase {
  APIServiceManager(serviceUrl) : super(url: BASE_URL + serviceUrl);
}
