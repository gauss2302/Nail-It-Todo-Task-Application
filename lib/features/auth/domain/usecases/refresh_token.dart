import 'package:fpdart/fpdart.dart';
import 'package:nail_it/core/error/failure.dart';
import 'package:nail_it/core/usecase/usecase.dart';
import 'package:nail_it/features/auth/domain/entities/auth_response.dart';
import 'package:nail_it/features/auth/domain/repositories/auth_repo.dart';

class RefreshToken implements UseCase<AuthResponse, NoParams> {
  final AuthRepository repository;

  RefreshToken(this.repository);

  @override
  Future<Either<Failure, AuthResponse>> call(NoParams params) async {
    return await repository.refreshToken();
  }
}
