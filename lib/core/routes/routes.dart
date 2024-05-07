import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nail_it/core/widgets/navbar.dart';
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

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final _routes = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    StatefulShellRoute.indexedStack(
        builder: (BuildContext context, GoRouterState state,
            StatefulNavigationShell navigationShell) {
          return NavBar(navigationShell: navigationShell);
        },
        branches: <StatefulShellBranch>[
          StatefulShellBranch(routes: [
            GoRoute(
              path: "/",
              builder: (BuildContext context, GoRouterState state) =>
                  const MyHomeScreen(),
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: '/goals',
              pageBuilder: (context, state) =>
                  const MaterialPage(child: GoalsScreen()),
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: '/achievment',
              pageBuilder: (context, state) =>
                  const MaterialPage(child: AchievmentScreen()),
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: '/profile',
              pageBuilder: (BuildContext context, GoRouterState state) =>
                  const MaterialPage(child: MyProfilePage()),
            ),
            GoRoute(
              path: '/settings',
              pageBuilder: (BuildContext context, GoRouterState state) =>
                  const MaterialPage(child: SettingsScreen()),
            ),
          ]),
        ]),
  ],
);
