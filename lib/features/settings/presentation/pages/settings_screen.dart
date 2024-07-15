import 'package:flutter/material.dart';
import 'package:nail_it/core/widgets/appbar.dart';
import 'package:nail_it/core/widgets/drawer.dart';
import 'package:nail_it/features/settings/presentation/pages/theme_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UpperBar(appbartitle: "S E T T I N G S"),
      drawer: DrawerMenu(),
      // bottomNavigationBar: NavBar(),
      body: Center(
          child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  ListBody(
                    children: [
                      ListTile(
                        title: Text('Language'),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                        title: Text('Theme'),
                        trailing: Icon(Icons.arrow_forward_ios),
                        onTap: () =>
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ThemeScreen())),
                      ),
                      ListTile(
                        title: Text('Notifications'),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                ],
              ))),
    );
  }
}
