import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:nail_it/core/theme/app_pallete.dart';

class DrawerMenu extends StatelessWidget implements PreferredSizeWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
        children: <Widget>[
          const DrawerHeader(
            curve: Curves.elasticIn,
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.only(
              //   bottomLeft: Radius.circular(30.0),
              //   bottomRight: Radius.circular(30.0),
              // ),
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
            child: Text('Drawer Header'),
          ),
          Container(
            child: Column(
              children: [
                ListTile(
                  leading: const LineIcon.tasks(
                    size: 40.0,
                    color: AppPallete.blueColor,
                  ),
                  title: const Text('M Y  T A S K S'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const LineIcon.archive(
                    size: 40.0,
                    color: AppPallete.blueColor,
                  ),
                  title: const Text('G O A L S'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const LineIcon.award(
                    size: 40.0,
                    color: AppPallete.blueColor,
                  ),
                  title: const Text('A C H I E V E M E N T S'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          const Divider(
            color: AppPallete.blueColor,
            thickness: 1.0,
          ),
          Container(
            child: Column(
              children: [
                ListTile(
                  leading: const LineIcon.googlePlay(
                    size: 40.0,
                    color: AppPallete.blueColor,
                  ),
                  title: const Text('Google Play'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const LineIcon.appStore(
                    size: 40.0,
                    color: AppPallete.blueColor,
                  ),
                  title: const Text('App Store'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(40);
}
