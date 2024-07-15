import 'package:flutter/material.dart';
import 'package:nail_it/core/theme/app_pallete.dart';

class AppTheme {
  static ThemeData get dark => ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: AppPallete.darkThemeAppBar),
        ),
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: Colors.indigo,
        ),
      );

  static ThemeData get light => ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
            backgroundColor: AppPallete.whiteColor, titleTextStyle: TextStyle(color: Colors.white, fontSize: 22)),
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.light,
          seedColor: const Color.fromARGB(255, 85, 81, 87),
        ),
      );
}
