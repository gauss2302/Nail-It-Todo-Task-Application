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

// final GoRouter _router = GoRouter(
//   initialLocation: '/home',
//   routes: <RouteBase>[
//     GoRoute(
//         path: "/",
//         builder: (BuildContext context, GoRouterState state) {
//           return const MyRootApp();
//         }),
//     GoRoute(
//         path: '/home',
//         pageBuilder: (context, state) =>
//             const MaterialPage(child: MyRootApp())),
//     GoRoute(
//         path: '/profile',
//         pageBuilder: (context, state) =>
//             const MaterialPage(child: MyProfilePage())),
//     GoRoute(
//       path: '/goals',
//       pageBuilder: (context, state) => const MaterialPage(child: GoalsScreen()),
//     ),
//     GoRoute(
//       path: '/achievment',
//       pageBuilder: (context, state) =>
//           const MaterialPage(child: AchievmentScreen()),
//     ),
//     GoRoute(
//       path: '/settings',
//       pageBuilder: (context, state) =>
//           const MaterialPage(child: SettingsScreen()),
//     ),
//   ],
// );

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routes = ref.read(routeProvider);

    return MaterialApp.router(
        // routerConfig: routes,
        );
  }
}
