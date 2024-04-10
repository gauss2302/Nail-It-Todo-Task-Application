import 'package:flutter/material.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        AssetImage('lib/assets/pics/just_do_it.jpeg'),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Shia LaBeouf',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Email: gaussdev@example.com',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Location: New York',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox.square(
                dimension: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListBody(
                  children: [
                    ListTileTheme(
                        child: ListTile(
                      leading: const Icon(Icons.email_outlined),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      title: const Text('My Profile'),
                      subtitle: const Text('Edit your profile'),
                      onTap: () {
                        // Navigate to the profile edit page
                      },
                    )),
                    ListTileTheme(
                        child: ListTile(
                      leading: const Icon(Icons.favorite_outline_rounded),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      title: const Text('My My Favorites'),
                      subtitle: const Text('Check your favorite items'),
                      onTap: () {
                        // Navigate to the profile edit page
                      },
                    )),
                    ListTileTheme(
                        child: ListTile(
                      leading: const Icon(Icons.group_rounded),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      title: const Text('My Communities'),
                      subtitle: const Text('Check your circles'),
                      onTap: () {
                        // Logout the user
                      },
                    )),
                    ListTileTheme(
                        child: ListTile(
                      leading: const Icon(Icons.logout),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      title: const Text('Logout'),
                      subtitle: const Text('Sign out of your account'),
                      onTap: () {
                        // Logout the user
                      },
                    )),
                  ],
                ),
              ),
              // Add other features here
            ],
          ),
        ),
      ),
    );
  }
}
