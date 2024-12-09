import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:line_icons/line_icon.dart';
import 'package:nail_it/core/theme/app_pallete.dart';
import 'package:nail_it/core/theme/fonts.dart';

class NavBar extends StatefulWidget {
  const NavBar({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>("NavBar"));

  final StatefulNavigationShell navigationShell;

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  // Navigation items configuration
  final List<NavItem> _items = const [
    NavItem(
      icon: LineIcon.mapPin(),
      label: "Home",
      route: '/',
    ),
    NavItem(
      icon: LineIcon.earlybirds(),
      label: "Goals",
      route: '/goals',
    ),
    NavItem(
      icon: LineIcon.tasks(), // Changed icon to represent tasks
      label: "Tasks",
      route: '/tasks',
    ),
    NavItem(
      icon: LineIcon.user(),
      label: "Profile",
      route: '/profile',
    ),
  ];
  // ... rest of the code

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom,
          left: 16,
          right: 16,
          top: 8,
        ),
        child: CustomNavigationBar(
          iconSize: 30.0,
          selectedColor: Colors.white,
          strokeColor: const Color.fromARGB(255, 179, 66, 66),
          unSelectedColor: AppPallete.whiteColor,
          backgroundColor: AppPallete.gradient1,
          borderRadius: const Radius.circular(20.0),
          blurEffect: true,
          opacity: 0.8,
          items: _buildNavigationItems(),
          isFloating: true,
          currentIndex: widget.navigationShell.currentIndex,
          onTap: (index) => _onTap(context, index),
        ),
      ),
    );
  }

  List<CustomNavigationBarItem> _buildNavigationItems() {
    return _items.map((item) {
      final isSelected = _items.indexOf(item) == widget.navigationShell.currentIndex;

      return CustomNavigationBarItem(
        icon: item.icon,
        title: Text(
          item.label,
          style: TextStyle(
            fontFamily: Fonts.raleway,
            fontSize: 12,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            color: isSelected ? Colors.white : Colors.white12,
          ),
        ),
      );
    }).toList();
  }

  void _onTap(BuildContext context, int index) {
    // Add haptic feedback
    HapticFeedback.lightImpact();

    // Navigate to the selected branch
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }
}

// Model class for navigation items
class NavItem {
  final Widget icon;
  final String label;
  final String route;

  const NavItem({
    required this.icon,
    required this.label,
    required this.route,
  });
}

// Extension for navigation helpers
extension NavBarExtension on BuildContext {
  bool get isHomeTab => GoRouterState.of(this).uri.toString() == '/';
  bool get isGoalsTab => GoRouterState.of(this).uri.toString().startsWith('/goals');
  bool get isTasksTab => GoRouterState.of(this).uri.toString().startsWith('/tasks');
  bool get isProfileTab => GoRouterState.of(this).uri.toString().startsWith('/profile');
}
