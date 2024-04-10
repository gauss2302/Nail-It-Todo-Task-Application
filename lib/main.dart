import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_icons/line_icon.dart';
import 'package:nail_it/core/widgets/appbar.dart';
import 'package:nail_it/core/widgets/drawer.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/widgets/navbar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(url: 'SUPERBASE_URL', anonKey: 'SUPERBASE_KEY');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyRootApp(),
    );
  }
}

class MyRootApp extends ConsumerStatefulWidget {
  const MyRootApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyRootAppState();
}

class _MyRootAppState extends ConsumerState<MyRootApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const UpperBar(),
      drawer: const DrawerMenu(),
      bottomNavigationBar: const NavBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
        child: Center(
          child: Column(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        contentPadding: const EdgeInsets.all(18),
                        hintText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            8,
                          ),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        contentPadding: const EdgeInsets.all(18),
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            8,
                          ),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'Awesome Line Icons are great!',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: 48.0,
              ),
              // Using LineIcon (no 's') for concision. It returns an Icon object
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  LineIcon.hippo(
                    size: 48.0,
                    color: Colors.blue,
                  ),
                  LineIcon.heart(
                    size: 48.0,
                    color: Colors.red,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
