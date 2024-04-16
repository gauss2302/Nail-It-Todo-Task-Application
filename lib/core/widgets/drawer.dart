import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
                    leading: const LineIcon.tasks(
                      size: 40.0,
                      color: AppPallete.gradient1,
                    ),
                    title: const Text('M Y  T A S K S'),
                    onTap: () {
                      context.push('/');
                    },
                  ),
                  ListTile(
                    leading: const LineIcon.archive(
                      size: 40.0,
                      color: AppPallete.gradient1,
                    ),
                    title: const Text('G O A L S'),
                    onTap: () {
                      context.push('/goals');
                    },
                  ),
                  ListTile(
                    leading: const LineIcon.award(
                      size: 40.0,
                      color: AppPallete.gradient1,
                    ),
                    title: const Text('A C H I E V E M E N T S'),
                    onTap: () {
                      context.push('/achievment');
                    },
                  ),
                  ListTile(
                    leading: const LineIcon.personEnteringBooth(
                      size: 40.0,
                      color: AppPallete.gradient1,
                    ),
                    title: const Text('P R O F I L E'),
                    onTap: () {
                      context.push('/profile');
                    },
                  ),
                  ListTile(
                    leading: const LineIcon.cog(
                      size: 40.0,
                      color: AppPallete.gradient1,
                    ),
                    title: const Text('S E T T I N G S'),
                    onTap: () {
                      context.push('/settings');
                    },
                  ),
                  const Divider(
                    indent: 1,
                    color: AppPallete.gradient1,
                    height: 1.0,
                    thickness: 1.0,
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      children: [
                        ListTile(
                          leading: const LineIcon.googlePlay(
                            size: 40.0,
                            color: AppPallete.gradient1,
                          ),
                          title: const Text('Google Play'),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          leading: const LineIcon.appStore(
                            size: 40.0,
                            color: AppPallete.gradient1,
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
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(40);
}
