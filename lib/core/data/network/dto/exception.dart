part of data;

class BaseException extends DioError implements Exception {
  String errMessage;
  BaseException(
      RequestOptions requestOptions,
      Response<dynamic>? response,
      this.errMessage,
      ) : super(requestOptions: requestOptions, response: response);

  @override
  String toString() {
    return '$runtimeType $message\n$stackTrace';
  }

  @override
  StackTrace get stackTrace {
    return StackTrace.fromString(
      'path: ${requestOptions.path}\n'
          'headers: ${requestOptions.headers},\n'
          'queryParameters: ${requestOptions.queryParameters},\n'
          'data: ${requestOptions.data},\n'
          'response: ${response?.data}',
    );
  }
}

class BadRequest extends BaseException {
  BadRequest(super.requestOptions, super.response, super.errMessage);
}

class Forbidden extends BaseException {
  Forbidden(super.requestOptions, super.response, super.errMessage);
}

class NotFound extends BaseException {
  NotFound(super.requestOptions, super.response, super.errMessage);
}

class Conflict extends BaseException {
  Conflict(super.requestOptions, super.response, super.errMessage);
}

class Unauthorized extends BaseException {
  Unauthorized(super.requestOptions, super.response, super.errMessage);
}




class WrongOtpCode extends BaseException {
  WrongOtpCode(super.requestOptions, super.response, super.errMessagee);
}

class ServerUnavailable extends BaseException {
  ServerUnavailable(super.requestOptions, super.response, super.errMessage);
}

class ServerTemporarilyUnavailable extends BaseException {
  ServerTemporarilyUnavailable(super.requestOptions, super.response, super.errMessage);
}

class NoInternetConnection extends BaseException {
  NoInternetConnection(super.requestOptions, super.response, super.errMessage);
}

class Duplicate extends BaseException {
  Duplicate(super.requestOptions, super.response, super.errMessage);
}

class Timeout extends BaseException {
  Timeout(super.requestOptions, super.response, super.errMessage);
}

class TooManyRequests extends BaseException {
  TooManyRequests(super.requestOptions, super.response, super.errMessage);

  String? get retryAfter {
    return response?.headers.value('retry-after');
  }
}

class UnprocessableEntity extends BaseException {
  UnprocessableEntity(super.requestOptions, super.response, super.message);
}

class NotAcceptable extends BaseException {
  NotAcceptable(super.requestOptions, super.response, super.message);

  @override
  String get message {
    return response?.data['message'];
  }
}

class UnknownError extends BaseException {
  UnknownError(super.requestOptions, super.response, super.message);
}
