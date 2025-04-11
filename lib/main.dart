import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:appwrite/appwrite.dart';
import 'package:nail_it/core/services/appwrite_service.dart';

import 'package:nail_it/features/tasks/presentation/bloc/task_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'package:nail_it/core/theme/theme.dart';
import 'package:nail_it/core/theme/theme_cubit/theme_cubit.dart';
import 'package:nail_it/core/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final client = AppwriteService.client;
  final account = AppwriteService.account;
  final database = AppwriteService.databases;

  HydratedBlocOverrides.runZoned(
    () => runApp(const MyApp()),
    storage: await HydratedStorage.build(
      storageDirectory: kIsWeb ? HydratedStorage.webStorageDirectory : await getApplicationDocumentsDirectory(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final routes = AppRouter().router;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider(
          create: (context) => TaskBloc(context.read()),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          return MultiRepositoryProvider(
            providers: [
              RepositoryProvider.value(value: AppwriteService.client),
              RepositoryProvider.value(value: AppwriteService.account),
              RepositoryProvider.value(value: AppwriteService.databases),
              RepositoryProvider.of(context),
            ],
            child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              theme: AppTheme.light,
              darkTheme: AppTheme.dark,
              themeMode: state,
              routerConfig: routes,
            ),
          );
        },
      ),
    );
  }
}
