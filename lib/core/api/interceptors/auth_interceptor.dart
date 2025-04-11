import 'package:dio/dio.dart';
import 'package:nail_it/core/storage/secure_storage.dart';

class AuthInterceptor extends Interceptor {
  final SecureStorage secureStorage;
  final AuthRepository authRepository;
}
