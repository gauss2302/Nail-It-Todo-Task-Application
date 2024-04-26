import 'package:fpdart/fpdart.dart';
import 'package:nail_it/core/error/failure.dart';
import 'package:nail_it/core/usecase/usecase.dart';
import 'package:nail_it/features/auth/domain/entities/user_entities.dart';
import 'package:nail_it/features/auth/domain/repositories/auth_repo.dart';

class UserLogin implements UseCase<UserEntities, UserLoginParams> {
  final AuthRepo authRepo;
  const UserLogin(this.authRepo);

  @override
  Future<Either<Failure, UserEntities>> call(UserLoginParams params) async {
    return await authRepo.signInWithEmailPassword(
        email: params.email, password: params.password);
  }
}

class UserLoginParams {
  final String email;
  final String password;

  UserLoginParams({required this.email, required this.password});
}
