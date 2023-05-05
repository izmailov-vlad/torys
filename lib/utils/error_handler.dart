import '../core/data/data.dart';
import 'app_logger.dart';

abstract class ErrorHandler {
  static void catchError(Object error, StackTrace stackTrace, Function(BaseError error) callback) {
    final baseError = _getError(error);
    AppLogger.logError(error: error, message: error.toString(), stackTrace: stackTrace);
    callback(baseError);
  }

  static BaseError _getError(dynamic error) {
    if (error is NoInternetConnection) {
      return BaseError(
        ErrorType.noInternetConnection,
        message: error.errMessage,
      );
    } else if (error is Unauthorized) {
      return BaseError(
        ErrorType.unauthorized,
        message: error.errMessage,
      );
    } else if (error is NotFound) {
      return BaseError(ErrorType.notFound);
    } else if (error is ServerUnavailable ||
        error is ServerTemporarilyUnavailable) {
      return BaseError(ErrorType.serverUnavailable);
    } else if (error is TooManyRequests) {
      return BaseError(
        ErrorType.tooManyRequests,
        message: error.retryAfter,
      );
    } else if (error is NotAcceptable) {
      return BaseError(
        ErrorType.notAcceptable,
        message: error.message,
      );
    } else if (error is UnprocessableEntity) {
      return BaseError(
        ErrorType.unprocessableEntity,
        message: error.errMessage,
      );
    } else if (error is BadRequest) {
      return BaseError(
        ErrorType.badRequest,
        message: error.errMessage,
      );
    } else {
      return BaseError(
        ErrorType.unknown,
        message: error.toString(),
      );
    }
  }
}

class BaseError {
  final ErrorType errorType;
  final String? message;

  BaseError(
    this.errorType, {
    this.message,
  });
}

enum ErrorType {
  noInternetConnection,
  unauthorized,
  notFound,
  serverUnavailable,
  tooManyRequests,
  badRequest,
  unprocessableEntity,
  notAcceptable,
  unknown,
}
