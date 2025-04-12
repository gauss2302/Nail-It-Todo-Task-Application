// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fpdart/src/either.dart';
import 'package:nail_it/core/error/exception.dart';
import 'package:nail_it/core/error/failure.dart';
import 'package:nail_it/core/network/network_info.dart';
import 'package:nail_it/core/storage/secure_storage.dart';
import 'package:nail_it/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:nail_it/features/auth/data/datasources/auth_remote_data_source.dart.dart';
import 'package:nail_it/features/auth/data/models/user_model.dart';
import 'package:nail_it/features/auth/domain/entities/auth_response.dart';
import 'package:nail_it/features/auth/domain/entities/user.dart';
import 'package:nail_it/features/auth/domain/repositories/auth_repo.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  final NetworkInfo networkInfo;
  final SecureStorage secureStorage;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
    required this.secureStorage,
  });

  @override
  Future<Either<Failure, User>> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, AuthResponse>> login({
    required String email,
    required String password,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final authResponse = await remoteDataSource.login(
          email: email,
          password: password,
        );

        // Save token in secure storage
        await secureStorage.setAccessToken(authResponse.accessToken);

        // Convert User to UserModel and save
        final userModel = _convertToUserModel(authResponse.user);
        await localDataSource.cacheUser(userModel);

        return Right(authResponse);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      } on UnauthorizedException catch (e) {
        return Left(UnauthorizedFailure(e.message));
      } catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    } else {
      return const Left(NetworkFailure('No internet connection available'));
    }
  }

  @override
  Future<Either<Failure, void>> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, AuthResponse>> refreshToken() {
    // TODO: implement refreshToken
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, AuthResponse>> register({
    required String email,
    required String password,
    required String name,
    required String phone, // Changed from username to phone
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final authResponse = await remoteDataSource.register(
          username: name, // Using name as username since we don't have a username parameter
          email: email,
          password: password,
          name: name,
        );

        await secureStorage.setAccessToken(authResponse.accessToken);

        final userModel = _convertToUserModel(authResponse.user);
        await localDataSource.cacheUser(userModel);

        return Right(authResponse);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      } on ConflictException catch (e) {
        return Left(ConflictFailure(e.message));
      } catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    } else {
      return const Left(NetworkFailure('No internet connection available'));
    }
  }

  UserModel _convertToUserModel(User user) {
    if (user is UserModel) {
      return user;
    }

    return UserModel(
      id: user.id,
      username: user.username,
      email: user.email,
      name: user.name,
      createdAt: user.createdAt,
      updatedAt: user.updatedAt,
    );
  }
}
