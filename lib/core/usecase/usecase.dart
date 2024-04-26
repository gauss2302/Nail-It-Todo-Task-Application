import 'package:fpdart/fpdart.dart';
import 'package:nail_it/core/error/failure.dart';

abstract interface class UseCase<Succes, Params> {
  Future<Either<Failure, Succes>> call(Params params);
}

class NoParams {}
