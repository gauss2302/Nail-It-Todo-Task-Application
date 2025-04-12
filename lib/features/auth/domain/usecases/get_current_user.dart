import 'package:fpdart/fpdart.dart';
import 'package:nail_it/core/error/failure.dart';
import 'package:nail_it/core/usecase/usecase.dart';
import 'package:nail_it/features/auth/domain/entities/user.dart';
import 'package:nail_it/features/auth/domain/repositories/auth_repo.dart';

class GetCurrentUser implements UseCase<User, NoParams> {
  final AuthRepository repository;

  GetCurrentUser(this.repository);

  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await repository.getCurrentUser();
  }
}
