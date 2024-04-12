import 'package:flutter/material.dart';
import 'package:nail_it/core/widgets/appbar.dart';
import 'package:nail_it/core/widgets/appbar.dart';
import 'package:nail_it/core/widgets/drawer.dart';
import 'package:nail_it/core/widgets/navbar.dart';

class GoalsScreen extends StatefulWidget {
  const GoalsScreen({super.key});

  @override
  State<GoalsScreen> createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: UpperBar(
        appbartitle: 'M Y  G O A L S',
      ),
      drawer: DrawerMenu(),
      bottomNavigationBar: NavBar(),
      body: Center(
        child: Text('Goals Screen'),
      ),
    );
  }
}
