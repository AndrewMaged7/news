import 'package:dio/dio.dart';
import 'package:news/core/exceptions/exceptions.dart';
class ErrorHandler {
  static AppException handle(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.transformTimeout:
        return const NetworkException(
          'Connection timeout. Please try again.',
        );
      case DioExceptionType.connectionError:
        return const NetworkException(
          'No internet connection.',
        );
      case DioExceptionType.badResponse:
        return _handleResponse(error.response);
      case DioExceptionType.cancel:
        return const NetworkException(
          'Request was cancelled.',
        );
      case DioExceptionType.badCertificate:
        return const NetworkException(
          'Bad SSL certificate.',
        );
      case DioExceptionType.unknown:
        return const UnknownException(
          'Something went wrong. Please try again.',
        );
    }
  }
  static AppException _handleResponse(Response? response) {
    final statusCode = response?.statusCode;
    switch (statusCode) {
      case 400:
        return ValidationException(
          _getMessage(response) ?? 'Bad request.',
        );
      case 401:
        return AuthException(
          _getMessage(response) ?? 'Unauthorized.',
        );
      case 403:
        return AuthException(
          _getMessage(response) ?? 'Access denied.',
        );
      case 404:
        return ServerException(
          _getMessage(response) ?? 'Resource not found.',
        );
      case 422:
        return ValidationException(
          _getMessage(response) ?? 'Validation error.',
        );
      case 500:
      case 502:
      case 503:
      case 504:
        return ServerException(
          _getMessage(response) ?? 'Server error.',
        );
      default:
        return ServerException(
          _getMessage(response) ?? 'Something went wrong.',
        );
    }
  }
  static String? _getMessage(Response? response) {
    if (response?.data is Map<String, dynamic>) {
      final data = response!.data as Map<String, dynamic>;
      return data['message'] ??
          data['error'] ??
          data['title'];
    }
    return null;
  }
}
