import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:nail_it/core/widgets/appbar.dart';
import 'package:nail_it/core/widgets/drawer.dart';

import 'hero_list_page.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const UpperBar(
        appbartitle: 'N A I L  I T',
      ),
      drawer: const DrawerMenu(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
        child: Center(
          child:          HeroListPage(),
          // child: SingleChildScrollView(
          //   dragStartBehavior: DragStartBehavior.down,
          //   padding: const EdgeInsets.all(24),
          //   child: Column(
          //     children: [
                // Card(
                //   child: Column(
                //     children: [
                //       const Text('Welcome to the Home Screen', selectionColor: Color.fromARGB(125, 217, 3, 255)),
                //       const Text('This is the Home Screen', selectionColor: Color.fromARGB(125, 217, 3, 255)),
                //       const Text('You can navigate to other screens', selectionColor: Color.fromARGB(125, 217, 3, 255)),
                //
                //     ],
                //   ),
                // ),

              // ],
            ),
          ),
        

    );
  }
}
