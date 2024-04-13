import 'package:nail_it/features/auth/data/models/user_model.dart';

abstract interface class AuthDataSource {
  Future<UserModel> signUpWithEmailPassword({
    required String username,
    required String email,
    required String password,
  });

  Future<UserModel> signInWithEmailPassword({
    required String email,
    required String password,
  });

  Future<UserModel> getCurrentUserData();
}

class AuthDataSourceImpl implements AuthDataSource {
  @override
  Future<UserModel> getCurrentUserData() {
    // TODO: implement getCurrentUserData
    throw UnimplementedError();
  }

  @override
  Future<UserModel> signInWithEmailPassword(
      {required String email, required String password}) {
    // TODO: implement signInWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<UserModel> signUpWithEmailPassword(
      {required String username,
      required String email,
      required String password}) {
    // TODO: implement signUpWithEmailPassword
    throw UnimplementedError();
  }
}
