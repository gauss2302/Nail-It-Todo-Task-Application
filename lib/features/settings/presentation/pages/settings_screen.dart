import 'package:flutter/material.dart';
import 'package:nail_it/core/widgets/appbar.dart';
import 'package:nail_it/core/widgets/drawer.dart';
import 'package:nail_it/core/widgets/navbar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const UpperBar(appbartitle: "S E T T I N G S"),
      drawer: const DrawerMenu(),
      bottomNavigationBar: const NavBar(),
      body: const Center(
          child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  ListBody(
                    children: [
                      ListTile(
                        title: const Text('Language'),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                        title: const Text('Theme'),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                        title: const Text('Notifications'),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                ],
              ))),
    );
  }
}
