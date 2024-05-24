import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:line_icons/line_icon.dart';
import 'package:nail_it/core/theme/app_pallete.dart';

class DrawerMenu extends StatelessWidget implements PreferredSizeWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: ShapeBorder.lerp(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        1.0,
      ),
      elevation: 5.0,
      semanticLabel: 'Drawer',
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const DrawerHeader(
                curve: Curves.elasticIn,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  ),
                  gradient: LinearGradient(
                    colors: [
                      AppPallete.blueColor,
                      AppPallete.gradient1,
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  color: AppPallete.blueColor,
                ),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Nail It',
                          style:
                              TextStyle(fontSize: 30.0, color: Colors.white)),
                      FlutterLogo(size: 100.0),
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ListTile(
                    leading: const Icon(MingCute.task_2_fill,
                        size: 40, color: AppPallete.gradient1),
                    title: const Text('M Y  T A S K S'),
                    onTap: () => context.push('/'),
                  ),
                  ListTile(
                    leading: const Icon(MingCute.task_line,
                        size: 40, color: AppPallete.gradient1),
                    title: const Text('G O A L S'),
                    onTap: () {
                      // context.push('/goals');
                      context.go('/goals');
                    },
                  ),
                  ListTile(
                    leading: const Icon(MingCute.birthday_2_fill,
                        size: 40, color: AppPallete.gradient1),
                    title: const Text('A C H I E V E M E N T S'),
                    onTap: () {
                      context.push('/achievment');
                    },
                  ),
                  ListTile(
                    leading: const Icon(MingCute.profile_fill,
                        size: 40, color: AppPallete.gradient1),
                    title: const Text('P R O F I L E'),
                    onTap: () {
                      context.push('/profile');
                    },
                  ),
                  ListTile(
                    leading: const Icon(MingCute.settings_1_fill,
                        size: 40, color: AppPallete.gradient1),
                    title: const Text('S E T T I N G S'),
                    onTap: () {
                      context.push('/settings');
                    },
                  ),
                  const SizedBox(height: 30),
                  const Divider(
                    indent: 1,
                    color: AppPallete.gradient1,
                    height: 1.0,
                    thickness: 1.0,
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: const Column(
                      children: [
                        ListTile(
                          leading: Icon(MingCute.reddit_fill,
                              size: 50,
                              color: Color.fromARGB(255, 238, 28, 28)),
                          title: Text('Reddit'),
                        ),
                        ListTile(
                          leading: Icon(MingCute.wechat_fill,
                              size: 50,
                              color: Color.fromARGB(255, 42, 237, 104)),
                          title: Text('WeChat'),
                        ),
                        ListTile(
                          leading: Icon(MingCute.github_fill,
                              size: 50, color: Color.fromARGB(255, 0, 0, 0)),
                          title: Text('GitHub'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(40);
}
