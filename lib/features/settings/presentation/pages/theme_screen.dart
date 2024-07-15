import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nail_it/core/theme/theme_cubit/theme_cubit.dart';
import 'package:nail_it/core/widgets/appbar.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  final List<Map<String, dynamic>> _themes = const [
    {'label': 'Dark', 'mode': ThemeMode.dark},
    {'label': 'Light', 'mode': ThemeMode.light},
    {'label': 'System', 'mode': ThemeMode.system},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const UpperBar(
        appbartitle: 'T H E M E',
      ),
      body: Center(
        child: BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, selectedTheme) {
            return Column(
              children: List.generate(_themes.length, (index) {
                final String label = _themes[index]['label'];
                final ThemeMode theme = _themes[index]['mode'];

                return ListTile(
                    title: Text(
                      label,
                      style: TextStyle(fontWeight: selectedTheme == theme ? FontWeight.bold : null),
                    ),
                    onTap: () => context.read<ThemeCubit>().updateTheme(theme),
                    trailing: selectedTheme == theme
                        ? Icon(Icons.check, color: Theme.of(context).colorScheme.primary)
                        : null);
              }),
            );
          },
        ),
      ),
    );
  }
}
