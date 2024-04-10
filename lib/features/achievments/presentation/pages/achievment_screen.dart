import 'package:flutter/material.dart';

class AchievmentScreen extends StatefulWidget {
  const AchievmentScreen({super.key});

  @override
  State<AchievmentScreen> createState() => _AchievmentScreenState();
}

class _AchievmentScreenState extends State<AchievmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Achievments'),
      ),
      body: const Center(
        child: Text('Achievments Screen'),
      ),
    );
  }
}
