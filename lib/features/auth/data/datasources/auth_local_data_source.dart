import 'package:nail_it/core/error/exception.dart';
import 'package:nail_it/core/storage/secure_storage.dart';
import 'package:nail_it/features/auth/data/models/user_model.dart';

abstract class AuthLocalDataSource {
  Future<UserModel> getCachedUser();
  Future<void> cacheUser(UserModel user);
  Future<void> clearCachedUser();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SecureStorage secureStorage;
  AuthLocalDataSourceImpl({
    required this.secureStorage,
  });
  @override
  Future<void> cacheUser(UserModel user) async {
    try {
      await secureStorage.setUserId(user.id);
      await secureStorage.setUserEmail(user.email);
      await secureStorage.setUserName(user.name);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<void> clearCachedUser() async {
    try {
      await secureStorage.clearAuthData();
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<UserModel> getCachedUser() async {
    try {
      final userId = await secureStorage.getUserId();
      final userEmail = await secureStorage.getUserEmail();
      final userName = await secureStorage.getUserName();

      if (userId == null || userEmail == null) {
        throw CacheException(message: 'No cached user found');
      }

      return UserModel(
        id: userId,
        username: '',
        email: userEmail,
        name: userName ?? '',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }
}
