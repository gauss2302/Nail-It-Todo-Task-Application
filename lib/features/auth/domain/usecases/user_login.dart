import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:nail_it/core/error/failure.dart';
import 'package:nail_it/core/usecase/usecase.dart';
import 'package:nail_it/features/auth/domain/entities/auth_response.dart';
import 'package:nail_it/features/auth/domain/repositories/auth_repo.dart';

class LoginUser implements UseCase<AuthResponse, LoginParams> {
  final AuthRepository repository;

  LoginUser(this.repository);

  @override
  Future<Either<Failure, AuthResponse>> call(LoginParams params) async {
    return await repository.login(
      email: params.email,
      password: params.password,
    );
  }
}

class LoginParams extends Equatable {
  final String email;
  final String password;

  const LoginParams({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}
