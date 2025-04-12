import 'package:nail_it/core/api/api_client.dart';
import 'package:nail_it/core/api/api_constants.dart';
import 'package:nail_it/features/auth/data/models/auth_response_model.dart';
import 'package:nail_it/features/auth/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  /// Returns [AuthResponseModel] if successful
  /// Throws [ServerException] if there's an error
  Future<AuthResponseModel> login({
    required String email,
    required String password,
  });

  /// Returns [AuthResponseModel] if successful
  /// Throws [ServerException] if there's an error
  Future<AuthResponseModel> register({
    required String email,
    required String username,
    required String password,
    required String name,
  });

  /// Throws [ServerException] if there's an error
  Future<void> logout();

  /// Returns [AuthResponseModel] with new token if successful
  /// Throws [ServerException] if there's an error
  Future<AuthResponseModel> refreshToken();

  /// Returns [UserModel] if successful
  /// Throws [ServerException] if there's an error
  Future<UserModel> getCurrentUser();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient apiClient;

  AuthRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<UserModel> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<AuthResponseModel> login({required String email, required String password}) async {
    try {
      final response = await apiClient.post(ApiConstants.login, data: {
        'email': email,
        'password': password,
      });
      return AuthResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> logout() async {
    try {
      await apiClient.post(ApiConstants.logout);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AuthResponseModel> register(
      {required String email, required String username, required String password, required String name}) async {
    try {
      final response = await apiClient.post(ApiConstants.register, data: {
        'email': email,
        'username': username,
        'password': password,
        'name': name,
      });

      return AuthResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AuthResponseModel> refreshToken() async {
    try {
      final response = await apiClient.post(ApiConstants.refreshToken);
      return AuthResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
