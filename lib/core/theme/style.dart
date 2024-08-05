import 'package:flutter/material.dart';

ThemeData lightTheme(BuildContext context) => ThemeData.from(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.pink,
        brightness: Brightness.dark,
      ),
    );

ThemeData darkTheme(BuildContext context) => ThemeData.from(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.pink,
        brightness: Brightness.dark,
      ),
    );
