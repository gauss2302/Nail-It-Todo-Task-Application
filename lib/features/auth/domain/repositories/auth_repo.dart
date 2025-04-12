import 'package:fpdart/fpdart.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:nail_it/core/error/failure.dart';
import 'package:nail_it/features/auth/domain/entities/auth_response.dart';
import 'package:nail_it/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthResponse>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, AuthResponse>> register({
    required String email,
    required String password,
    required String name,
    required String phone,
  });

  Future<Either<Failure, void>> logout();

  Future<Either<Failure, User>> getCurrentUser();

  Future<Either<Failure, AuthResponse>> refreshToken();
}
