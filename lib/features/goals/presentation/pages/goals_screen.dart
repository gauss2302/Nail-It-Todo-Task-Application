import 'package:flutter/material.dart';
import 'package:nail_it/core/widgets/appbar.dart';
import 'package:nail_it/core/widgets/drawer.dart';

class GoalsScreen extends StatefulWidget {
  const GoalsScreen({super.key});

  @override
  State<GoalsScreen> createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const UpperBar(
        appbartitle: 'M Y  G O A L S',
      ),
      drawer: const DrawerMenu(),
      // bottomNavigationBar: const NavBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Text(
                'My Goals',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              RichText(
                text: const TextSpan(
                  text:
                      'This is where you can set your goals and track your progress. You can also see your achievements here.',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
              ),

              // Add Database fetch here, create milestones for achievements
              SizedBox(
                height: 200, // or any other value
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 5,
                    childAspectRatio: 1,
                  ),
                  children: const <Widget>[
                    Icon(Icons.star),
                    Icon(Icons.favorite),
                    Icon(Icons.check),
                    Icon(Icons.done_all_sharp),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
