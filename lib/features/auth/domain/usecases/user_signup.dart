import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:nail_it/core/error/failure.dart';
import 'package:nail_it/core/usecase/usecase.dart';
import 'package:nail_it/features/auth/domain/entities/auth_response.dart';
import 'package:nail_it/features/auth/domain/repositories/auth_repo.dart';

class RegisterUser implements UseCase<AuthResponse, RegisterParams> {
  final AuthRepository repository;

  RegisterUser(this.repository);

  @override
  Future<Either<Failure, AuthResponse>> call(RegisterParams params) async {
    return await repository.register(
      email: params.email,
      password: params.password,
      name: params.name,
      phone: params.phone,
    );
  }
}

class RegisterParams extends Equatable {
  final String email;
  final String password;
  final String name;
  final String phone;

  const RegisterParams({
    required this.email,
    required this.password,
    required this.name,
    required this.phone,
  });

  @override
  List<Object> get props => [email, password, name, phone];
}
