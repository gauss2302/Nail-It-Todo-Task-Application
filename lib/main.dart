import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:nail_it/features/auth/presentation/bloc/auth_bloc.dart';

import 'package:nail_it/features/tasks/presentation/bloc/task_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:nail_it/core/di/injection_container.dart' as di;

import 'package:nail_it/core/theme/theme.dart';
import 'package:nail_it/core/theme/theme_cubit/theme_cubit.dart';
import 'package:nail_it/core/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );

  // Initialize dependency injection
  await di.init();
  runApp(const MyApp());
}

class MyAppObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    if (kDebugMode) {
      print('onCreate -- ${bloc.runtimeType}');
    }
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    if (kDebugMode) {
      print('onEvent -- ${bloc.runtimeType}, $event');
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    if (kDebugMode) {
      print('onError -- ${bloc.runtimeType}, $error');
    }
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (kDebugMode) {
      print('onChange -- ${bloc.runtimeType}, $change');
    }
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    if (kDebugMode) {
      print('onTransition -- ${bloc.runtimeType}, $transition');
    }
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    if (kDebugMode) {
      print('onClose -- ${bloc.runtimeType}');
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      Bloc.observer = MyAppObserver();
    }

    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (_) => di.sl<ThemeCubit>(),
      ),
      BlocProvider(
        create: (_) =>
        di.sl<AuthBloc>()
          ..add(AuthCheckRequested()),
      ),
    ], child: BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, state) {
        final appRouter = AppRouter();
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: "Nail IT",
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          routerConfig: appRouter.router,
        );
      },
    ));
  }
}
