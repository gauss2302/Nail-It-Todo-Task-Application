import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:nail_it/core/api/api_client.dart';
import 'package:nail_it/core/api/api_constants.dart';
import 'package:nail_it/core/api/interceptors/auth_interceptor.dart';
import 'package:nail_it/core/network/network_info.dart';
import 'package:nail_it/core/storage/secure_storage.dart';
import 'package:nail_it/core/theme/theme_cubit/theme_cubit.dart';
import 'package:nail_it/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:nail_it/features/auth/data/datasources/auth_remote_data_source.dart.dart';
import 'package:nail_it/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:nail_it/features/auth/domain/repositories/auth_repo.dart';
import 'package:nail_it/features/auth/domain/usecases/get_current_user.dart';
import 'package:nail_it/features/auth/domain/usecases/logout_user.dart';
import 'package:nail_it/features/auth/domain/usecases/refresh_token.dart';
import 'package:nail_it/features/auth/domain/usecases/user_login.dart';
import 'package:nail_it/features/auth/domain/usecases/user_signup.dart';
import 'package:nail_it/features/auth/presentation/bloc/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await _registerCore();
  await _registerAuth();
  await _registerTasks();

}

Future<void> _registerCore() async {
  // External dependencies
  sl.registerLazySingleton(() => InternetConnection());
  sl.registerLazySingleton(() => const FlutterSecureStorage());
  sl.registerLazySingleton(() => Dio());

  // Core classes
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => SecureStorage(secureStorage: sl()));
  sl.registerFactory(() => ThemeCubit());

  // Circular dependency resolution for API client
  // We need to register AuthRepository placeholder first
  sl.registerLazySingletonAsync<AuthRepository>(() async {
    return Future.value(AuthRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
      secureStorage: sl(),
    ));
  });

  // Register auth interceptor with placeholder repository
  sl.registerLazySingleton<AuthInterceptor>(() => AuthInterceptor(
    secureStorage: sl(),
    authRepository: sl.getAsync<AuthRepository>(),
  ));

  // API Client
  sl.registerLazySingleton<ApiClient>(() => ApiClient(
    baseUrl: ApiConstants.baseUrl,
    dio: sl(),
    authInterceptor: sl(),
  ));
}

Future<void> _registerAuth() async {
  // Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl(apiClient: sl()),
  );
  sl.registerLazySingleton<AuthLocalDataSource>(
        () => AuthLocalDataSourceImpl(secureStorage: sl()),
  );

  // Repository implementation
  // This will be created when the async placeholder is resolved
  await sl.isReady<AuthRepository>();

  // Use cases
  sl.registerLazySingleton(() => LoginUser(sl()));
  sl.registerLazySingleton(() => RegisterUser(sl()));
  sl.registerLazySingleton(() => LogoutUser(sl()));
  sl.registerLazySingleton(() => GetCurrentUser(authRepository: sl()));
  sl.registerLazySingleton(() => RefreshToken(sl()));

  // BLoC
  sl.registerFactory(() => AuthBloc(
    userSignUp: sl(),
    userLogin: sl(),
    logoutUser: sl(),
    getCurrentUser: sl(),
    refreshToken: sl(),
  ));
}

Future<void> _registerTasks() async {
  // Register task-related dependencies here
}