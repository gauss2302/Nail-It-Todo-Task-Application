import 'package:fpdart/src/either.dart';
import 'package:nail_it/core/error/failure.dart';
import 'package:nail_it/core/usecase/usecase.dart';
import 'package:nail_it/features/auth/domain/entities/user_entities.dart';
import 'package:nail_it/features/auth/domain/repositories/auth_repo.dart';

class UserSignUp implements UseCase<UserEntities, UserSignUpParams> {
  final AuthRepo authRepo;
  const UserSignUp(this.authRepo);

  @override
  Future<Either<Failure, UserEntities>> call(UserSignUpParams params) async {
    return await authRepo.signUpWithEmailPassword(
        email: params.email,
        username: params.username,
        password: params.password);
  }
}

class UserSignUpParams {
  final String email;
  final String username;
  final String password;

  UserSignUpParams(
      {required this.email, required this.username, required this.password});
}
