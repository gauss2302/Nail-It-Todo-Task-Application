import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:line_icons/line_icon.dart';
import 'package:nail_it/core/widgets/appbar.dart';
import 'package:nail_it/core/widgets/drawer.dart';

class MyHomeScreen extends ConsumerStatefulWidget {
  const MyHomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends ConsumerState<MyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: UpperBar(
        appbartitle: 'N A I L  I T',
      ),
      drawer: DrawerMenu(),
      // bottomNavigationBar: const NavBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
        child: Center(
          child: Column(
            children: [
              SingleChildScrollView(
                dragStartBehavior: DragStartBehavior.down,
                padding: EdgeInsets.all(24),
                child: Column(
                  children: [
                    Text('Home Screen',
                        selectionColor: Color.fromARGB(125, 217, 3, 255)),
                  ],
                ),
              ),

              // Using LineIcon (no 's') for concision. It returns an Icon object
            ],
          ),
        ),
      ),
    );
  }
}
