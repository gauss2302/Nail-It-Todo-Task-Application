import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nail_it/core/routes/routes.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await dotenv.load(fileName: ".env");

  // String superbaseUrl = dotenv.env['SUPERBASE_URL']!;
  // String superbaseKey = dotenv.env['SUPERBASE_KEY']!;

  final superbase =
      await Supabase.initialize(url: 'SUPERBASE_URL', anonKey: 'SUPERBASE_KEY');
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routes = ref.read(routeProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: routes as RouterConfig<Object>?,
    );
  }
}
