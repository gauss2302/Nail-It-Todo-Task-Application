import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    return Scaffold(
      appBar: const UpperBar(
        appbartitle: 'N A I L  I T',
      ),
      drawer: const DrawerMenu(),
      // bottomNavigationBar: const NavBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
        child: Center(
          child: Column(
            children: [
              const SingleChildScrollView(
                dragStartBehavior: DragStartBehavior.down,
                padding: EdgeInsets.all(24),
                child: Column(
                  children: [
                    LineIcon.hippo(
                      size: 48.0,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Text('Home Screen',
                  style: Theme.of(context).textTheme.headlineMedium,
                  softWrap: true,
                  selectionColor: const Color.fromARGB(125, 217, 3, 255)),

              // Using LineIcon (no 's') for concision. It returns an Icon object
            ],
          ),
        ),
      ),
    );
  }
}
