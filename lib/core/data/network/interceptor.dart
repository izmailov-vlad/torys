part of data;

class AppInterceptor extends InterceptorsWrapper {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response != null) {
      AppLogger.logResponse(err.response!);
    }

    String errMessage = 'Unknown Error';
    if (err.response?.data != null) {
      errMessage =
          (err.response?.data as Map<dynamic, dynamic>)['data']['message'];
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
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
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
