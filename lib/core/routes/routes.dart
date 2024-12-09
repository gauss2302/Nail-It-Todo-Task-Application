import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nail_it/core/widgets/navbar.dart';
import 'package:nail_it/features/achievments/presentation/pages/achievment_screen.dart';
import 'package:nail_it/features/goals/presentation/pages/goals_screen.dart';
import 'package:nail_it/features/home/presentation/pages/home_screen.dart';
import 'package:nail_it/features/profile/presentation/pages/my_profile_screen.dart';
import 'package:nail_it/features/search/presentation/pages/search_screen.dart';
import 'package:nail_it/features/settings/presentation/pages/settings_screen.dart';
import 'package:nail_it/features/tasks/presentation/pages/task_screen.dart';

abstract class AppRoutes {
  // Branch 1 - Home
  static const home = '/';

  // Branch 2 - Goals & Tasks
  static const goals = '/goals';
  static const achievement = '/achievement';
  static const tasks = '/tasks';

  // Branch 3 - Profile
  static const profile = '/profile';
  static const settings = '/settings';

  // Branch 4 - Tasks
  static const tasksList = '/tasks';

  // Branch 5 - Search
  static const search = '/search';
}

class AppRouter {
  final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

  // Create navigator keys for each branch
  final List<GlobalKey<NavigatorState>> _shellNavigatorKeys = [
    GlobalKey<NavigatorState>(debugLabel: 'shell_home'),
    GlobalKey<NavigatorState>(debugLabel: 'shell_goals'),
    GlobalKey<NavigatorState>(debugLabel: 'shell_profile'),
    GlobalKey<NavigatorState>(debugLabel: 'shell_tasks'),
    GlobalKey<NavigatorState>(debugLabel: 'shell_search'),
  ];

  late final GoRouter _router;

  AppRouter() {
    _router = GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: AppRoutes.home,
      debugLogDiagnostics: true, // Helpful for debugging
      routes: [
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return NavBar(navigationShell: navigationShell);
          },
          branches: _buildBranches(),
        ),
      ],
    );
  }

  List<StatefulShellBranch> _buildBranches() {
    return [
      // Home Branch
      StatefulShellBranch(
        navigatorKey: _shellNavigatorKeys[0],
        routes: [
          GoRoute(
            path: AppRoutes.home,
            builder: (context, state) => const MyHomeScreen(),
          ),
        ],
      ),

      // Goals Branch
      StatefulShellBranch(
        navigatorKey: _shellNavigatorKeys[1],
        routes: [
          GoRoute(
            path: AppRoutes.goals,
            pageBuilder: (context, state) => const MaterialPage(
              child: GoalsScreen(),
              name: 'Goals',
            ),
            routes: [
              GoRoute(
                path: 'achievement',
                pageBuilder: (context, state) => const MaterialPage(
                  child: GoalsScreen(),
                  name: 'Achievement',
                ),
              ),
              GoRoute(
                path: 'tasks',
                pageBuilder: (context, state) => const MaterialPage(
                  child: TaskScreen(),
                  name: 'Tasks',
                ),
              ),
            ],
          ),
        ],
      ),

      // Profile Branch
      StatefulShellBranch(
        navigatorKey: _shellNavigatorKeys[2],
        routes: [
          GoRoute(
            path: AppRoutes.profile,
            pageBuilder: (context, state) => const MaterialPage(
              child: MyProfilePage(),
              name: 'Profile',
            ),
            routes: [
              GoRoute(
                path: 'settings',
                pageBuilder: (context, state) => const MaterialPage(
                  child: SettingsScreen(),
                  name: 'Settings',
                ),
              ),
            ],
          ),
        ],
      ),

      // Tasks Branch
      StatefulShellBranch(
        navigatorKey: _shellNavigatorKeys[3],
        routes: [
          GoRoute(
            path: AppRoutes.tasksList,
            pageBuilder: (context, state) => const MaterialPage(
              child: TaskScreen(),
              name: 'Tasks',
            ),
          ),
        ],
      ),

      // Search Branch
      StatefulShellBranch(
        navigatorKey: _shellNavigatorKeys[4],
        routes: [
          GoRoute(
            path: AppRoutes.search,
            pageBuilder: (context, state) => const MaterialPage(
              child: SearchScreen(),
              name: 'Search',
            ),
          ),
        ],
      ),
    ];
  }

  GoRouter get router => _router;
}
