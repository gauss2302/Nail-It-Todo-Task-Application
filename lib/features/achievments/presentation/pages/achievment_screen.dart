// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nail_it/core/widgets/appbar.dart';
import 'package:nail_it/core/widgets/drawer.dart';

class AchievmentScreen extends StatefulWidget {
  const AchievmentScreen({super.key});

  @override
  State<AchievmentScreen> createState() => _AchievmentScreenState();
}

class _AchievmentScreenState extends State<AchievmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UpperBar(
        appbartitle: "A C H I E V M E N T S",
      ),
      drawer: const DrawerMenu(),
      // bottomNavigationBar: const NavBar(),
      body: const Center(
        child: Text('Achievments Screen'),
      ),
    );
  }
}
