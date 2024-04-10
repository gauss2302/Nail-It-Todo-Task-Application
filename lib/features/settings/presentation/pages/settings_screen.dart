import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: const Center(
          child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Text('Settings Screen'),
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
