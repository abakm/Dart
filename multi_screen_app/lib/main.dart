import 'package:flutter/material.dart';
import 'package:multi_screen_app/data/dummy.dart';
import 'package:multi_screen_app/screens/items.dart';
import 'package:multi_screen_app/screens/tabs.dart';
import 'screens/categories.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/items.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: theme,
        // home: const CategoryScreen());
        home: const Tabs());
  }
}
