// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fpdart/src/either.dart';
import 'package:nail_it/core/error/exception.dart';
import 'package:nail_it/core/error/failure.dart';
import 'package:nail_it/core/network/connection_checker.dart';
import 'package:nail_it/features/auth/data/datasources/auth_data.dart';
import 'package:nail_it/features/auth/data/models/user_model.dart';
import 'package:nail_it/features/auth/domain/entities/user_entities.dart';
import 'package:nail_it/features/auth/domain/repositories/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthDataSource remoteDataSource;
  final ConnectionChecker connectionChecker;

  AuthRepoImpl(this.remoteDataSource, this.connectionChecker);

  // @override
  // Future<Either<Failure, UserEntities>> currentUser() async {
  //   if (!await connectionChecker.isConnected) {
  //     return left(Failure('No internet connection'));
  //   }
  //
  //   try {
  //     final result = await remoteDataSource.getCurrentUserData();
  //     return right(result?.toEntity() ?? UserEntities.empty());
  //   } on ServerException catch (e) {
  //     return left(Failure(e.message));
  //   }
  // }

  // @override
  // Future<Either<Failure, UserEntities>> signInWithEmailPassword({
  //   required String email,
  //   required String password,
  // }) async {
  //   if (!await connectionChecker.isConnected) {
  //     return left(Failure('No internet connection'));
  //   }
  //
  //   try {
  //     final result = await remoteDataSource.signInWithEmailPassword(
  //       email: email,
  //       password: password,
  //     );
  //     return result;
  //     // return right(result.toEntity());
  //   } on ServerException catch (e) {
  //     return left(Failure(e.message));
  //   }
  // }

  @override
  Future<Either<Failure, UserEntities>> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserEntities>> signUpWithEmailPassword(
      {required String email, required String username, required String password}) {
    // TODO: implement signUpWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserEntities>> signInWithEmailPassword({required String email, required String password}) {
    // TODO: implement signInWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserEntities>> currentUser() {
    // TODO: implement currentUser
    throw UnimplementedError();
  }
}
