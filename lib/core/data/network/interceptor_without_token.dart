part of data;

@Injectable()
class WithoutTokenInterceptor extends InterceptorsWrapper {
  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response != null) {
      AppLogger.logError(
          error: err, message: err.message!, stackTrace: err.stackTrace);
    }

    String errMessage = 'Unknown Error';
    if (err.response?.data != null) {
      if (err.response?.data is Map<dynamic, dynamic>) {
        errMessage =
            (err.response?.data as Map<dynamic, dynamic>)['data']['message'];
      } else {
        errMessage = (err.response?.data as String);
      }
    }

    switch (err.response?.statusCode) {
      case 400:
        super.onError(
            BadRequest(err.requestOptions, err.response, errMessage), handler);
        break;
      case 401:
        super.onError(
            Unauthorized(err.requestOptions, err.response, errMessage),
            handler);

        break;
      case 403:
        super.onError(
            Unauthorized(err.requestOptions, err.response, errMessage),
            handler);

        break;
      case 404:
        super.onError(
            NotFound(err.requestOptions, err.response, errMessage), handler);
        break;
      case 406:
        super.onError(
            NotAcceptable(err.requestOptions, err.response, errMessage),
            handler);
        break;
      case 429:
        super.onError(
            TooManyRequests(err.requestOptions, err.response, errMessage),
            handler);
        break;
      case 422:
        super.onError(
            UnprocessableEntity(err.requestOptions, err.response, errMessage),
            handler);
        break;
      // case 500:
      case 500:
        super.onError(
            ServerUnavailable(err.requestOptions, err.response, errMessage),
            handler);
        break;
      case 503:
        super.onError(
            ServerTemporarilyUnavailable(
                err.requestOptions, err.response, errMessage),
            handler);
        break;
      default:
        super.onError(
            UnknownError(err.requestOptions, err.response, errMessage),
            handler);
        break;
    }
  }

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    AppLogger.logRequest(options);

    return handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    AppLogger.logResponse(response);
    return handler.next(response);
  }
}
