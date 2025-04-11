import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:nail_it/core/routes/routes.dart';
import 'package:nail_it/core/theme/app_pallete.dart';

class DrawerMenu extends StatelessWidget implements PreferredSizeWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // ... existing drawer code ...
      child: ListView(
        children: [
          // ... header ...
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ListTile(
                leading: const Icon(MingCute.task_2_fill, size: 40, color: AppPallete.gradient1),
                title: const Text('M Y  T A S K S'),
                onTap: () {
                  context.go(AppRoutes.tasks);
                  Navigator.pop(context); // Close drawer
                },
              ),
              ListTile(
                leading: const Icon(MingCute.task_line, size: 40, color: AppPallete.gradient1),
                title: const Text('G O A L S'),
                onTap: () {
                  context.go(AppRoutes.goals);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(MingCute.birthday_2_fill, size: 40, color: AppPallete.gradient1),
                title: const Text('A C H I E V E M E N T S'),
                onTap: () {
                  context.go(AppRoutes.achievement);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(MingCute.profile_fill, size: 40, color: AppPallete.gradient1),
                title: const Text('P R O F I L E'),
                onTap: () {
                  context.go(AppRoutes.profile);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(MingCute.settings_1_fill, size: 40, color: AppPallete.gradient1),
                title: const Text('S E T T I N G S'),
                onTap: () {
                  context.go(AppRoutes.settings);
                  Navigator.pop(context);
                },
              ),
              // ... rest of your drawer items ...
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(40);
}
