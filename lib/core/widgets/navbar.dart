import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:nail_it/core/theme/fonts.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    var index = 0;
    return CustomNavigationBar(
      iconSize: 30.0,
      selectedColor: const Color(0xff040307),
      strokeColor: const Color(0x30040307),
      unSelectedColor: const Color(0xffacacac),
      backgroundColor: Colors.white,
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
      currentIndex: index,
      onTap: (index) {
        index = index;
      },
    );
  }
}
