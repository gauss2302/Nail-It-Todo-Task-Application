import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:nail_it/core/widgets/appbar.dart';
import 'package:nail_it/core/widgets/drawer.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: UpperBar(
        appbartitle: 'N A I L  I T',
      ),
      drawer: DrawerMenu(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
        child: Center(
          child: SingleChildScrollView(
            dragStartBehavior: DragStartBehavior.down,
            padding: EdgeInsets.all(24),
            child: Column(
              children: [
                Text('Home Screen', selectionColor: Color.fromARGB(125, 217, 3, 255)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
