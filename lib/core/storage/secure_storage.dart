import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final FlutterSecureStorage _storage;

  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _userIdKey = 'user_id';
  static const String _userEmailKey = 'user_email';
  static const String _userTypeKey = 'user_type'; // 'user' or 'owner'
  static const String _userNameKey = 'user_name';

  static const AndroidOptions _androidOptions = AndroidOptions(
    encryptedSharedPreferences: true,
  );

  SecureStorage({FlutterSecureStorage? secureStorage})
      : _storage = secureStorage ?? const FlutterSecureStorage(aOptions: _androidOptions);

  Future<void> setAccessToken(String token) async {
    await _storage.write(key: _accessTokenKey, value: token);
  }

  Future<String?> getAccessToken() async {
    return await _storage.read(key: _accessTokenKey);
  }

  Future<void> setRefreshToken(String token) async {
    await _storage.write(key: _refreshTokenKey, value: token);
  }

  Future<String?> getRefreshToken() async {
    return await _storage.read(key: _refreshTokenKey);
  }

  Future<void> setUserId(String userId) async {
    await _storage.write(key: _userIdKey, value: userId);
  }

  Future<String?> getUserId() async {
    return await _storage.read(key: _userIdKey);
  }

  Future<void> setUserEmail(String email) async {
    await _storage.write(key: _userEmailKey, value: email);
  }

  Future<String?> getUserEmail() async {
    return await _storage.read(key: _userEmailKey);
  }

  Future<void> setUserType(String type) async {
    await _storage.write(key: _userTypeKey, value: type);
  }

  Future<String?> getUserType() async {
    return await _storage.read(key: _userTypeKey);
  }

  Future<void> setUserName(String name) async {
    await _storage.write(key: _userNameKey, value: name);
  }

  Future<String?> getUserName() async {
    return await _storage.read(key: _userNameKey);
  }

  Future<void> saveAuthData({
    required String accessToken,
    required String refreshToken,
    required String userId,
    required String email,
    required String type,
    String? name,
  }) async {
    await setAccessToken(accessToken);
    await setRefreshToken(refreshToken);
    await setUserId(userId);
    await setUserEmail(email);
    await setUserType(type);
    if (name != null) {
      await setUserName(name);
    }
  }

  Future<void> clearAuthData() async {
    await _storage.delete(key: _accessTokenKey);
    await _storage.delete(key: _refreshTokenKey);
    await _storage.delete(key: _userIdKey);
    await _storage.delete(key: _userEmailKey);
    await _storage.delete(key: _userTypeKey);
    await _storage.delete(key: _userNameKey);
  }

  Future<bool> isLoggedIn() async {
    final token = await getAccessToken();
    return token != null && token.isNotEmpty;
  }

  Future<bool> isOwner() async {
    final userType = await getUserType();
    return userType == 'owner';
  }
}
