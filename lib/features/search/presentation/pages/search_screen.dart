import 'package:flutter/material.dart';
import 'package:nail_it/core/widgets/appbar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const UpperBar(appbartitle: "Search Screen"),
      body: Center(
        child: Text('Search Screen'),
      ),
    );
  }
}
