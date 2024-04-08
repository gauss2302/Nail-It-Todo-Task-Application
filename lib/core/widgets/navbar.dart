import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:nail_it/core/theme/fonts.dart';
import 'package:nail_it/features/explore/presentation/pages/explore_screen.dart';
import 'package:nail_it/features/profile/presentation/pages/my_profile_screen.dart';
import 'package:nail_it/features/search/presentation/pages/search_screen.dart';
import 'package:nail_it/features/task/presentation/pages/task_screen.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;

    final List<Widget> _pages = [
      const TaskScreen(),
      const ExploreScreen(),
      const SearchScreen(),
      const MyProfilePage(),
    ];

    return CustomNavigationBar(
      iconSize: 30.0,
      selectedColor: Colors.white,
      strokeColor: Colors.white,
      unSelectedColor: Colors.grey[600],
      backgroundColor: Color.fromARGB(255, 214, 111, 216),
      borderRadius: const Radius.circular(20.0),
      blurEffect: true,
      opacity: 0.8,
      items: [
        CustomNavigationBarItem(
          icon: const LineIcon.mapPin(),
          title: const Text(
            "Home",
            style: TextStyle(fontFamily: Fonts.raleway),
          ),
        ),
        CustomNavigationBarItem(
          icon: const LineIcon.earlybirds(),
          title: const Text("Explore"),
        ),
        CustomNavigationBarItem(
          icon: const LineIcon.search(),
          title: const Text("Search"),
        ),
        CustomNavigationBarItem(
          icon: const LineIcon.user(),
          title: const Text("Me"),
        ),
      ],
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      // isFloating: true,
    );
  }
}
