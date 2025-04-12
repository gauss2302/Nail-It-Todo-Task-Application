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
  Future<Either<Failure, User>> getCurrentUser() async {
    try {
      final token = await secureStorage.getAccessToken();

      if (token == null || token.isEmpty) {
        return const Left(AuthFailure('Not authenticated'));
      }

      if (await networkInfo.isConnected) {
        try {
          final user = await remoteDataSource.getCurrentUser();

          final userModel = _convertToUserModel(user);
          await localDataSource.cacheUser(userModel);

          return Right(user);
        } on UnauthorizedException {
          final refreshResult = await refreshToken();

          return refreshResult.fold(
            (failure) async {
              try {
                final cachedUser = await localDataSource.getCachedUser();
                return Right(cachedUser);
              } on CacheException catch (e) {
                return Left(CacheFailure(e.message));
              }
            },
            (authResponse) async {
              try {
                final user = await remoteDataSource.getCurrentUser();
                final userModel = _convertToUserModel(user);
                await localDataSource.cacheUser(userModel);

                return Right(user);
              } catch (e) {
                try {
                  final cachedUser = await localDataSource.getCachedUser();
                  return Right(cachedUser);
                } on CacheException catch (e) {
                  return Left(CacheFailure(e.message));
                }
              }
            },
          );
        } catch (e) {
          try {
            final cachedUser = await localDataSource.getCachedUser();
            return Right(cachedUser);
          } on CacheException catch (e) {
            return Left(CacheFailure(e.message));
          }
        }
      } else {
        // If offline, return cached user
        try {
          final cachedUser = await localDataSource.getCachedUser();
          return Right(cachedUser);
        } on CacheException catch (e) {
          return Left(CacheFailure(e.message));
        }
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
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
  Future<Either<Failure, void>> logout() async {
    try {
      if (await networkInfo.isConnected) {
        try {
          await remoteDataSource.logout();
        } catch (e) {}
      }
      await localDataSource.clearCachedUser();
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthResponse>> refreshToken() async {
    if (await networkInfo.isConnected) {
      try {
        final authresponse = await remoteDataSource.refreshToken();
        await secureStorage.setAccessToken(authresponse.accessToken);
        final userModel = _convertToUserModel(authresponse.user);

        await localDataSource.cacheUser(userModel);
        return Right(authresponse);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      } on UnauthorizedException catch (e) {
        await localDataSource.clearCachedUser();
        return Left(UnauthorizedFailure(e.message));
      } catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    } else {
      return const Left(NetworkFailure('No internet connection available'));
    }
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
