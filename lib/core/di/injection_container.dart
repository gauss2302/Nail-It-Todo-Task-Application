import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:nail_it/core/api/api_client.dart';
import 'package:nail_it/core/api/api_constants.dart';
import 'package:nail_it/core/api/interceptors/auth_interceptor.dart';
import 'package:nail_it/core/network/network_info.dart';
import 'package:nail_it/core/storage/secure_storage.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await initCore();
}

Future<void> initCore() async {
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());
  sl.registerLazySingleton(() => InternetConnection());

  // Secure Storage
  sl.registerLazySingleton(() => const FlutterSecureStorage());
  sl.registerLazySingleton(() => SecureStorage(secureStorage: sl()));

  //Api Client and Interceptors
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton<AuthInterceptor>(() => AuthInterceptor(
        secureStorage: sl(),
        authRepository: sl(),
      ));

  sl.registerLazySingleton<ApiClient>(() => ApiClient(baseUrl: ApiConstants.baseUrl, dio: sl(), authInterceptor: sl()));
}
