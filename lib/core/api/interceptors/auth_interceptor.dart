import 'package:dio/dio.dart';
import 'package:nail_it/core/storage/secure_storage.dart';
import 'package:nail_it/features/auth/domain/repositories/auth_repo.dart';

class AuthInterceptor extends Interceptor {
  final SecureStorage secureStorage;
  final AuthRepository authRepository;

  AuthInterceptor({
    required this.secureStorage,
    required this.authRepository,
  });

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (_shouldAddAuthHeader(options)) {
      final token = await secureStorage.getAccessToken();
      if (token != null) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    }
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (!_isRefreshTokenRequest(err.requestOptions) && err.response?.statusCode == 401) {
      try {
        final newToken = await _refreshToken();

        if (newToken != null) {
          final options = err.requestOptions;
          options.headers['Authorization'] = 'Bearer $newToken';
          final response = await Dio().fetch(options);
          return handler.resolve(response);
        }
      } catch (e) {
        return handler.next(err);
      }
    }
  }

  bool _shouldAddAuthHeader(RequestOptions options) {
    final path = options.path;
    return !path.contains("/auth/login") &&
        !path.contains('/auth/register') &&
        !path.contains('/owner/auth/login') &&
        !path.contains('/owner/auth/register');
  }

  bool _isRefreshTokenRequest(RequestOptions options) {
    return options.path.contains('/auth/refresh') || options.path.contains('/owner/auth/refresh');
  }

  Future<String?> _refreshToken() async {
    try {
      final refreshTpoken = await secureStorage.getRefreshToken();
      if (refreshTpoken == null) return null;
      final result = await authRepository.refreshToken();
      return result.fold(
        (failure) => null,
        (authResponse) {
          secureStorage.setAccessToken(authResponse.accessToken);
          return authResponse.accessToken;
        },
      );
    } catch (e) {
      return null;
    }
  }
}
