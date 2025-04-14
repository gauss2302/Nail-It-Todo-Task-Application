import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';
import 'package:nail_it/core/widgets/navbar.dart';
import 'package:nail_it/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:nail_it/features/auth/presentation/pages/sign_in_screen.dart';
import 'package:nail_it/features/auth/presentation/pages/sign_up_screen.dart';
import 'package:nail_it/features/home/presentation/pages/home_screen.dart';
import 'package:nail_it/features/profile/presentation/pages/my_profile_screen.dart';
import 'package:nail_it/features/tasks/presentation/pages/task_screen.dart';

abstract class AppRoutes {
  // Auth routes
  static const login = '/login';
  static const register = '/register';

  // Main routes
  static const home = '/';
  static const profile = '/profile';
}

class AppRouter {
  final GlobalKey<NavigatorState> _rootNavigatorKey =
  GlobalKey<NavigatorState>(debugLabel: 'root');

  final GlobalKey<NavigatorState> _shellNavigatorKey =
  GlobalKey<NavigatorState>(debugLabel: 'shell');

  late final GoRouter router;

  AppRouter() {
    router = GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: AppRoutes.home,
      debugLogDiagnostics: true,
      redirect: _handleRedirect,
      routes: [
        // Auth routes (outside the shell)
        GoRoute(
          path: AppRoutes.login,
          name: 'login',
          builder: (context, state) => const SignInScreen(),
        ),
        GoRoute(
          path: AppRoutes.register,
          name: 'register',
          builder: (context, state) => const SignUpScreen(),
        ),

        // Shell route for bottom navigation
        ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) {
            return ScaffoldWithNavBar(child: child);
          },
          routes: [
            // Main app routes within the shell
            GoRoute(
              path: AppRoutes.home,
              name: 'home',
              builder: (context, state) => const MyHomeScreen(),
            ),
            GoRoute(
              path: AppRoutes.profile,
              name: 'profile',
              builder: (context, state) => const MyProfilePage(),
            ),
          ],
        ),
      ],
    );
  }

  String? _handleRedirect(BuildContext context, GoRouterState state) {
    // Check the authentication state
    final authState = context.read<AuthBloc>().state;
    final isLoggedIn = authState is AuthAuthenticated;

    // Auth routes that don't require authentication
    final isAuthRoute = state.fullPath == AppRoutes.login ||
        state.fullPath == AppRoutes.register;

    // If user is not logged in and trying to access protected routes
    if (!isLoggedIn && !isAuthRoute && state.fullPath != AppRoutes.home) {
      return AppRoutes.login;
    }

    // If user is logged in and trying to access auth routes
    if (isLoggedIn && isAuthRoute) {
      return AppRoutes.home;
    }

    // No redirection needed
    return null;
  }
}