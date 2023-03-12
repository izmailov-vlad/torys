import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class AppLogger {
  static final _logger = Logger(
    level: null,
    printer: PrettyPrinter(
      methodCount: 9,
      errorMethodCount: 9,
      lineLength: 100,
      colors: true,
      printEmojis: true,
      printTime: true,
    ),
  );

  static void log(
      {required String message, String? error, StackTrace? stackTrace}) {
    _logger.i(message, error, stackTrace);
  }

  static void logError(
      {String? message, Object? error, StackTrace? stackTrace}) {
    _logger.e(message, error, stackTrace);
  }

  static void logRequest(RequestOptions options) {
    final message = '--- request ---\n'
        'path: ${options.path}\n'
        'data: ${_formatJson(options.data)}\n'
        'method: ${options.method}\n'
        'headers: ${_formatJson(options.headers)}\n'
        'queryParameters: ${options.queryParameters}\n';

    _logger.i(message);
  }

  static void logResponse(Response<dynamic> response) {
    final data = _formatJson(response.data);
    final message = '--- response ---\n'
        'status code: ${response.statusCode}\n'
        'headers: ${_formatJson(response.requestOptions.headers)}\n'
        'path: ${response.realUri} - ${response.requestOptions.path}\n'
        'method: ${response.requestOptions.method}\n'
        'data: $data';

    _logger.i(message);
  }

  static dynamic _formatJson(dynamic json) {
    try {
      return const JsonEncoder.withIndent('  ').convert(json);
    } catch (_) {
      return json;
    }
  }

  static void logResponseError(Response<dynamic> response) {
    final data = _formatJson(response.data);
    final message = '--- request ---\n'
        'path: ${response.realUri} - ${response.requestOptions.path}\n'
        'data: ${_formatJson(response.requestOptions.data)}\n'
        'method: ${response.requestOptions.method}\n'
        'headers: ${_formatJson(response.requestOptions.headers)}\n'
        'queryParameters: ${response.requestOptions.queryParameters}\n'
        '--- response error ---\n'
        'status code: ${response.statusCode}\n'
        'data: $data';

    _logger.i(message);
  }
}
