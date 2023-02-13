import 'package:dio/dio.dart';

class ServerException implements Exception {}

class CacheException implements Exception {}

class ConnectionException implements Exception {}

class CustomException implements Exception {
  late String message;
  late int statusCode;

  CustomException.fromDioError(DioError error) {
    switch (error.type) {
      case DioErrorType.cancel:
        statusCode = 0;
        message = "Request to API server was cancelled";
        break;
      case DioErrorType.connectTimeout:
        statusCode = 0;
        message = "Connection timeout with API server";
        break;
      case DioErrorType.receiveTimeout:
        statusCode = 0;
        message = "Receive timeout in connection with API server";
        break;
      case DioErrorType.response:
        statusCode = error.response?.statusCode ?? 0;
        message = _handleError(
          error.response?.statusCode,
          error.response?.data,
        );
        break;
      case DioErrorType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      case DioErrorType.other:
        if (error.message.contains("SocketException")) {
          message = 'No Internet';
          break;
        }
        message = "Unexpected error occurred";
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  String _handleError(int? statusCode, dynamic error) {
    // switch (statusCode) {
    //   case 400:
    //     return 'Bad request';
    //   case 401:
    //     return 'Unauthorized';
    //   case 403:
    //     return 'Forbidden';
    //   case 404:
    //     return error['message'];
    //   case 500:
    //     return 'Internal server error';
    //   case 502:
    //     return 'Bad gateway';
    //   default:
    //     return 'Oops something went wrong';
    // }
    if (error != null) {
      return error['message'];
    } else {
      return 'Oops something went wrong';
    }
  }

  @override
  String toString() => message;
}
