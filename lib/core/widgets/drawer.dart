import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:nail_it/core/routes/routes.dart';
import 'package:nail_it/core/theme/app_pallete.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:nail_it/features/auth/presentation/bloc/auth_bloc.dart';

class DrawerMenu extends StatelessWidget implements PreferredSizeWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return ListView(
            padding: EdgeInsets.zero,
            children: [
              _buildDrawerHeader(context, state),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ListTile(
                    leading: const Icon(MingCute.profile_fill,
                        size: 26, color: AppPallete.gradient1),
                    title: const Text('Home'),
                    onTap: () {
                      context.go(AppRoutes.home);
                      Navigator.pop(context); // Close drawer
                    },
                  ),
                  if (state is AuthAuthenticated) ...[
                    ListTile(
                      leading:  Icon(MingCute.task_2_fill,
                          size: 26, color: AppPallete.gradient1),
                      title: const Text('My Task'),
                      onTap: () {
                        // Navigate to restaurants
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: const Icon(MingCute.add_circle_fill,
                          size: 26, color: AppPallete.gradient1),
                      title: const Text('Add Task'),
                      onTap: () {
                        // Navigate to add restaurant
                        Navigator.pop(context);
                      },
                    ),
                  ],
                  ListTile(
                    leading: const Icon(MingCute.profile_fill,
                        size: 26, color: AppPallete.gradient1),
                    title: const Text('Profile'),
                    onTap: () {
                      context.go(AppRoutes.home);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(MingCute.settings_1_fill,
                        size: 26, color: AppPallete.gradient1),
                    title: const Text('Settings'),
                    onTap: () {
                      context.go(AppRoutes.home);
                      Navigator.pop(context);
                    },
                  ),
                  const Divider(),
                  if (state is AuthAuthenticated)
                    ListTile(
                      leading: const Icon(MingCute.exit_fill,
                          size: 26, color: Colors.red),
                      title: const Text('Logout'),
                      onTap: () {
                        Navigator.pop(context);
                        context.read<AuthBloc>().add(AuthLogoutRequested());
                      },
                    )
                  else
                    ListTile(
                      leading: const Icon(MingCute.entrance_fill,
                          size: 26, color: AppPallete.gradient1),
                      title: const Text('Login'),
                      onTap: () {
                        Navigator.pop(context);
                        context.go(AppRoutes.login);
                      },
                    ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(40);

  Widget _buildDrawerHeader(BuildContext context, AuthState state) {
    if (state is AuthAuthenticated) {
      return UserAccountsDrawerHeader(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [AppPallete.gradient1, AppPallete.gradient2],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.white,
            child: Text(
              state.user.name.isNotEmpty
                  ? state.user.name[0].toUpperCase()
                  : (state.user.username.isNotEmpty
                      ? state.user.username[0].toUpperCase()
                      : "U"),
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: AppPallete.gradient1),
            ),
          ),
          accountName: Text(state.user.name.isNotEmpty
              ? state.user.name
              : state.user.username),
          accountEmail: Text(state.user.email));
    } else {
      return DrawerHeader(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [AppPallete.gradient1, AppPallete.gradient2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Nail It',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Task Management',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
            if (state is AuthLoading)
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  context.go(AppRoutes.login);
                },
                child: const Text("Sign In"),
              ),
          ],
        ),
      );
    }
  }
}
