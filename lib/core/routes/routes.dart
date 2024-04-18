import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nail_it/features/achievments/presentation/pages/achievment_screen.dart';
import 'package:nail_it/features/auth/presentation/pages/sign_in_screen.dart';
import 'package:nail_it/features/auth/presentation/pages/sign_up_screen.dart';
import 'package:nail_it/features/goals/presentation/pages/goals_screen.dart';
import 'package:nail_it/features/home/presentation/pages/home_screen.dart';
import 'package:nail_it/features/profile/presentation/pages/my_profile_screen.dart';
import 'package:nail_it/features/settings/presentation/pages/settings_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'routes.g.dart';

@riverpod
route(RouteRef _) => _routes;

final _routes = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: "/",
      builder: (context, state) => const MyHomeScreen(),
    ),
    GoRoute(
        path: '/login',
        pageBuilder: (context, state) =>
            const MaterialPage(child: SignInScreen())),
    GoRoute(
        path: '/signup',
        pageBuilder: (context, state) =>
            const MaterialPage(child: SignUpScreen())),
    GoRoute(
        path: '/profile',
        pageBuilder: (context, state) =>
            const MaterialPage(child: MyProfilePage())),
    GoRoute(
      path: '/goals',
      pageBuilder: (context, state) => const MaterialPage(child: GoalsScreen()),
    ),
    GoRoute(
      path: '/achievment',
      pageBuilder: (context, state) =>
          const MaterialPage(child: AchievmentScreen()),
    ),
    GoRoute(
      path: '/settings',
      pageBuilder: (context, state) =>
          const MaterialPage(child: SettingsScreen()),
    ),
  ],
);
