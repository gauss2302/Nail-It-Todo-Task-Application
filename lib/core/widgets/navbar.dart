import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:line_icons/line_icon.dart';
import 'package:nail_it/core/theme/fonts.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>("NavBar"));

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: CustomNavigationBar(
        iconSize: 30.0,
        selectedColor: Colors.white,
        strokeColor: Colors.white,
        unSelectedColor: Colors.grey[600],
        backgroundColor: const Color.fromARGB(255, 214, 111, 216),
        borderRadius: const Radius.circular(20.0),
        blurEffect: true,
        opacity: 0.8,
        items: [
          CustomNavigationBarItem(
            badgeCount: 0,
            icon: const LineIcon.mapPin(),
            title: const Text(
              "Home",
              style: TextStyle(fontFamily: Fonts.raleway),
            ),
          ),
          CustomNavigationBarItem(
            badgeCount: 1,
            icon: const LineIcon.earlybirds(),
            title: const Text("Explore"),
          ),
          CustomNavigationBarItem(
            badgeCount: 2,
            icon: const LineIcon.search(),
            title: const Text("Search"),
          ),
          CustomNavigationBarItem(
            badgeCount: 3,
            icon: const LineIcon.user(),
            title: const Text("Me"),
          ),
        ],
        isFloating: true,
        currentIndex: navigationShell.currentIndex,
        onTap: (int index) => _onTap(context, index),
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
