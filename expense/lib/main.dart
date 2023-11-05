import 'package:expense/widgets/expenses.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var kColorSchema =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 135, 27, 250));

var darkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 73, 69, 69));

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft])
      .then((fn) {
    runApp(MaterialApp(
        // theme: ThemeData()
        //     .copyWith(useMaterial3: true, scaffoldBackgroundColor: Color.fromARGB(255, 224, 106, 235)),
        darkTheme: ThemeData.dark().copyWith(
          useMaterial3: true,
          colorScheme: darkColorScheme,
          cardTheme: const CardTheme().copyWith(
              color: kColorSchema.secondaryContainer,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 16)),
        ),
        themeMode: ThemeMode.system,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: kColorSchema,
          appBarTheme: AppBarTheme(
              backgroundColor: kColorSchema.onPrimaryContainer,
              foregroundColor: kColorSchema.primaryContainer),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: kColorSchema.primaryContainer,
                  foregroundColor: kColorSchema.onPrimaryContainer)),
          cardTheme: const CardTheme().copyWith(
              color: Colors.redAccent,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 16)),
          textTheme: const TextTheme().copyWith(
              titleLarge: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                  fontSize: 16)),
        ),
        home: const Expenses()));
  });
}
