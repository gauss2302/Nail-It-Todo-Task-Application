import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio;
  final String baseUrl;

  ApiClient({
    required Dio dio,
    required this.baseUrl,
    required AuthInterceptor authInterceptor,

  })
}