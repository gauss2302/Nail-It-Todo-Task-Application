import 'package:fpdart/fpdart.dart';
import 'package:nail_it/core/error/failure.dart';
import 'package:nail_it/features/auth/domain/entities/user_entities.dart';

abstract interface class AuthRepo {
  Future<Either<Failure, UserEntities>> signUpWithEmailPassword({
    required String email,
    required String username,
    required String password,
  });

  Future<Either<Failure, UserEntities>> signInWithEmailPassword({
    required String email,
    required String password,
  });
}
