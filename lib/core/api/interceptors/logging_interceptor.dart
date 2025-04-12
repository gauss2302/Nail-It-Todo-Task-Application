import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final method = options.method;
    final uri = options.uri;

    if (kDebugMode) {
      print('┌─────────────────────────────────────────────────────────────────────');
      print('│ REQUEST[$method] => PATH: ${uri.path}');
      print('│ Headers: ${options.headers}');
      print('│ Query Parameters: ${options.queryParameters}');

      if (options.data != null) {
        print('│ Body: ${options.data}');
      }

      print('└─────────────────────────────────────────────────────────────────────');
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final statusCode = response.statusCode;
    final uri = response.requestOptions.uri;
    final method = response.requestOptions.method;

    if (kDebugMode) {
      print('┌─────────────────────────────────────────────────────────────────────');
      print('│ RESPONSE[$method] => PATH: ${uri.path}');
      print('│ StatusCode: $statusCode');
      print('│ Data: ${response.data}');
      print('└─────────────────────────────────────────────────────────────────────');
    }

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final statusCode = err.response?.statusCode;
    final uri = err.requestOptions.uri;
    final method = err.requestOptions.method;

    if (kDebugMode) {
      print('┌─────────────────────────────────────────────────────────────────────');
      print('│ ERROR[$method] => PATH: ${uri.path}');
      print('│ StatusCode: $statusCode');
      print('│ Error Message: ${err.message}');
      if (err.response != null) {
        print('│ Error Data: ${err.response?.data}');
      }
      print('└─────────────────────────────────────────────────────────────────────');
    }

    super.onError(err, handler);
  }
}
