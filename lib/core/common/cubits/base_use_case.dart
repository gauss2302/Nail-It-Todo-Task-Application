
import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:nail_it/core/error/failure.dart';

abstract class BaseUseCase<T, P> {

  Future<Either<Failure, T>> call (P param);
}

class DefaultParams extends Equatable {
  const DefaultParams();

  @override
  List<Object?> get props => [];
}