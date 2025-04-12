import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:nail_it/core/api/interceptors/auth_interceptor.dart';
import 'package:nail_it/core/api/interceptors/logging_interceptor.dart';
import 'package:nail_it/core/error/exception.dart';

class ApiClient {
  final Dio _dio;
  final String baseUrl;

  ApiClient({
    required Dio dio,
    required this.baseUrl,
    required AuthInterceptor authInterceptor,
  }) : _dio = dio {
    _dio.options.baseUrl = baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 30);
    _dio.options.receiveTimeout = const Duration(seconds: 30);
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    _dio.interceptors.add(authInterceptor);

    if (kDebugMode) {
      _dio.interceptors.add(LoggingInterceptor());
    }
  }

  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.get(path,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress);
      return response.data;
    } on DioException catch (e) {
      _handleDioError(e);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  Future<dynamic> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.post(path,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress);
      return response.data;
    } on DioException catch (e) {
      _handleDioError(e);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  Future<dynamic> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on DioException catch (e) {
      _handleDioError(e);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  Future<dynamic> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } on DioException catch (e) {
      _handleDioError(e);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  void _handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw NetworkException(message: 'Connection timeout');
      case DioExceptionType.badCertificate:
        throw NetworkException(message: 'Bad certificate');
      case DioExceptionType.badResponse:
        _handleErrorResponse(e.response);
      case DioExceptionType.cancel:
        throw RequestCancelledException(message: 'Request cancelled');
      case DioExceptionType.connectionError:
        throw NetworkException(message: 'No internet connection');
      case DioExceptionType.unknown:
        throw ServerException(message: e.message ?? 'Unknown error occurred');
    }
  }

  void _handleErrorResponse(Response? response) {
    if (response == null) {
      throw ServerException(message: 'Server error occurred');
    }

    final statusCode = response.statusCode;
    final errorMessage = response.data['error'] ?? 'Unknown error occurred';

    switch (statusCode) {
      case 400:
        throw BadRequestException(message: errorMessage);
      case 401:
        throw UnauthorizedException(message: 'Unauthorized: $errorMessage');
      case 403:
        throw ForbiddenException(message: 'Forbidden: $errorMessage');
      case 404:
        throw NotFoundException(message: 'Not found: $errorMessage');
      case 409:
        throw ConflictException(message: errorMessage);
      case 500:
      case 502:
      case 503:
      case 504:
        throw ServerException(message: 'Server error: $errorMessage');
      default:
        throw ServerException(message: errorMessage);
    }
  }
}
