import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:nail_it/core/error/failure.dart';

abstract class BaseUseCase<T, P> {
  Future<Either<Failure, T>> call(P param);

  Future<Either<Failure, T>> callNoParams() {
    return call(DefaultParams() as P);
  }

  Future<Either<Failure, T>> callWithNoParams() {
    return call(DefaultParams() as P);
  }
}

class DefaultParams extends Equatable {
  const DefaultParams();

  @override
  List<Object?> get props => [];
}
