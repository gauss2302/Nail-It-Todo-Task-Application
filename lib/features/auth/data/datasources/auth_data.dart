import 'package:nail_it/core/error/exception.dart';
import 'package:nail_it/features/auth/data/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthDataSource {
  Session? get session;
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

  Future<void> checkAppAnon();
}

class AuthDataSourceImpl implements AuthDataSource {
  final SupabaseClient superbaseClient;

  AuthDataSourceImpl(this.superbaseClient);

  @override
  Future<UserModel> getCurrentUserData() {
    throw UnimplementedError();
  }

  @override
  Session? get session => superbaseClient.auth.currentSession;

  @override
  Future<UserModel> signInWithEmailPassword(
      {required String email, required String password}) async {
    try {
      final res = await superbaseClient.auth.signInWithPassword(
        password: password,
        email: email,
      );
      if (res.user == null) {
        throw const ServerException('User is null!');
      }
      return UserModel.fromJson(res.user!.toJson());
    } on AuthException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel> signUpWithEmailPassword(
      {required String username,
      required String email,
      required String password}) async {
    try {
      final res = await superbaseClient.auth.signUp(
        password: password,
        email: email,
        data: {
          'username': username,
        },
      );

      if (res.user != null) {
        throw const ServerException("User already exists");
      }
      return UserModel.fromJson(res.user!.toJson());
    } on AuthException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> checkAppAnon() {
    // TODO: implement checkAppAnon
    throw UnimplementedError();
  }
}
