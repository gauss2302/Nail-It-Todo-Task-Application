import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'package:nail_it/features/tasks/presentation/bloc/task_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'package:nail_it/core/theme/theme.dart';
import 'package:nail_it/core/theme/theme_cubit/theme_cubit.dart';
import 'package:nail_it/core/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  String superbaseUrl = dotenv.env['SUPERBASE_URL']!;
  String superbaseKey = dotenv.env['SUPERBASE_KEY']!;

  final superbase = await Supabase.initialize(url: superbaseUrl, anonKey: superbaseKey);

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb ? HydratedStorage.webStorageDirectory : await getApplicationDocumentsDirectory(),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final routes = AppRouter().router;

    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          return RepositoryProvider(
            // create: TaskRepository(taskDataProvider: TaskDataProvider(prefs!)),
            create: (BuildContext context) {},
            child: BlocProvider(
              create: (context) => TaskBloc(context.read()),
              child: MaterialApp.router(
                debugShowCheckedModeBanner: false,
                theme: AppTheme.light,
                darkTheme: AppTheme.dark,
                themeMode: state,
                routerConfig: routes,
              ),
            ),
          );
        },
      ),
    );
  }
}
