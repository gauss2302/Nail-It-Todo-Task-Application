import 'package:flutter/material.dart';
import 'package:nail_it/core/theme/app_pallete.dart';
import 'package:nail_it/core/theme/fonts.dart';

class UpperBar extends StatelessWidget implements PreferredSizeWidget {
  const UpperBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppPallete.blueColor,
              AppPallete.gradient1,
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
      ),
      shape: ShapeBorder.lerp(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        1.0,
      ),
      title: const Text(
        'N A I L  I T 🫠 ',
        style: TextStyle(color: Colors.white, fontFamily: Fonts.raleway),
      ),
      toolbarOpacity: 0.8,
      backgroundColor: AppPallete.blueColor,
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(40);
}
