import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiService');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiService');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiService');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad certificate error');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioException.response!.statusCode!,
          dioException.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiService was cancelled');
      case DioExceptionType.connectionError:
        return ServerFailure('No Internet Connection');
      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        } else {
          return ServerFailure('Unexpected Error, please try again');
        }
      // ignore: unreachable_switch_default
      default:
        return ServerFailure('Oops, there was an error, please try again');
    }
  }
  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure(
        'Your request was not found, please try again later!',
      );
    } else if (statusCode == 500) {
      return ServerFailure('Internal server error, please try again later!');
    } else {
      return ServerFailure('Oops, there was an error, please try again');
    }
  }
}

class NetworkFailure extends Failure {
  NetworkFailure(super.errMessage);
}
