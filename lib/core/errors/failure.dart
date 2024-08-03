import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Connection timeout with API server");

      case DioExceptionType.receiveTimeout:
        return ServerFailure("Receive timeout in connection with API server");

      case DioExceptionType.sendTimeout:
        return ServerFailure("Send timeout in connection with API server");

      case DioExceptionType.cancel:
        return ServerFailure("Request to API server was cancelled");

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.badCertificate:
        return ServerFailure("Bad certificate");

      case DioExceptionType.connectionError:
        return ServerFailure("Connection error");
      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return ServerFailure("No Internet connection");
        }
        return ServerFailure("Unexpected error");

      default:
        return ServerFailure("Something went wrong");
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['message']);
    } else if (statusCode == 404) {
      return ServerFailure("Your request not found");
    } else if (statusCode == 500) {
      return ServerFailure("Internal server error");
    } else {
      return ServerFailure("Something went wrong");
    }
  }
}
