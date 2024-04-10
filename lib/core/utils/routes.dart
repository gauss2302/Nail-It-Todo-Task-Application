import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nail_it/main.dart';

class Routes {
  static GoRoute initialRoute = GoRoute(
    name: 'home',
    path: '/',
    pageBuilder: (context, state) => MaterialPage(child: MyRootApp()),
  );
}
