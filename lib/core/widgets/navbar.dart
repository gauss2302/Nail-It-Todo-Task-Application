import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:nail_it/core/theme/fonts.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;

    // final List<Widget> badgeCount = [
    //   const MyHomeScreen(),
    //   const ExploreScreen(),
    //   const SearchScreen(),
    //   const MyProfilePage(),
    // ];

    return CustomNavigationBar(
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
      currentIndex: currentIndex,
      onTap: (badgeCount) {
        setState(() {
          currentIndex = badgeCount;
        });
      },
      // isFloating: true,
    );
  }
}
