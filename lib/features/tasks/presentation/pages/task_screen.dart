import 'package:flutter/material.dart';

import 'package:nail_it/core/widgets/appbar.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: const UpperBar(appbartitle: 'M Y  T A S K S'),
      body: Center(
        child: Text('Task Screen'),
      ),
    );
  }
}
