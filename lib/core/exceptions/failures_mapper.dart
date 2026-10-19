import 'package:news/core/exceptions/exceptions.dart';
import 'package:news/core/exceptions/failures.dart';

class FailureMapper {
  static Failure map(AppException exception) {
    if (exception is ServerException) {
      return ServerFailure(exception.message);
    }

    if (exception is NetworkException) {
      return NetworkFailure(exception.message);
    }

    if (exception is CacheException) {
      return CacheFailure(exception.message);
    }

    if (exception is AuthException) {
      return AuthFailure(exception.message);
    }

    if (exception is ValidationException) {
      return ValidationFailure(exception.message);
    }

    return UnknownFailure(exception.message);
  }
}